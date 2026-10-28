import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../auth/presentation/auth_controller.dart';
import '../../auth/presentation/auth_providers.dart';
import '../../category/presentation/category_screen.dart';
import '../../product/presentation/product_providers.dart';
import 'widgets/home_bottom_nav_bar.dart';
import 'widgets/home_category_scroll_grid.dart';
import 'widgets/home_category_tabs.dart';
import 'widgets/home_header_bar.dart';
import 'widgets/home_new_user_promo_bar.dart';
import 'widgets/home_product_feed.dart';
import 'widgets/home_promotion_banner.dart';

/// Bottom navigation tabs for MillionX storefront.
enum HomeNavTab {
  home,
  categories,
  promotions,
  chat,
  account;

  static HomeNavTab fromIndex(int index) {
    if (index >= 0 && index < HomeNavTab.values.length) {
      return HomeNavTab.values[index];
    }
    return HomeNavTab.home;
  }
}

/// Clean, modular Home Screen with fixed responsive bottom navigation.
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  HomeNavTab _currentTab = HomeNavTab.home;
  String? _selectedCategoryId;
  String _keyword = '';
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    final maxScroll = position.maxScrollExtent;
    final currentScroll = position.pixels;
    // Requirement 2: เลื่อนใกล้ท้ายประมาณ 300–500 px จึงโหลดหน้าถัดไป
    const threshold = 400.0;
    if (maxScroll - currentScroll <= threshold) {
      ref.read(productFeedProvider.notifier).loadMore();
    }
  }

  void _selectCategory(String? catId) {
    setState(() {
      _selectedCategoryId = catId;
    });
    ref
        .read(productFeedProvider.notifier)
        .setFilter(categoryId: catId, updateCategory: true);
  }

  void _updateSearch(String value) {
    final trimmed = value.trim();
    setState(() {
      _keyword = trimmed;
    });
    ref
        .read(productFeedProvider.notifier)
        .setFilter(keyword: trimmed, updateKeyword: true);
  }

  void _onTabTapped(int index) {
    final tab = HomeNavTab.fromIndex(index);
    switch (tab) {
      case HomeNavTab.home:
        setState(() => _currentTab = HomeNavTab.home);
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
        break;
      case HomeNavTab.categories:
        setState(() => _currentTab = HomeNavTab.categories);
        break;
      case HomeNavTab.account:
        final auth = ref.read(authControllerProvider);
        if (auth.isSignedIn) {
          context.push('/account');
        } else {
          context.push('/login');
        }
        break;
      case HomeNavTab.promotions:
      case HomeNavTab.chat:
        setState(() => _currentTab = tab);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final feedState = ref.watch(productFeedProvider);
    final productCount = feedState.items.length;
    final rowCount = (productCount / 2).ceil();
    final feedHeight =
        80.0 +
        (rowCount == 0 ? 320.0 : rowCount * 308.0) +
        (feedState.isLoadingMore || feedState.loadMoreError != null
            ? 80.0
            : 40.0);
    final designHeight = 512.0 + feedHeight + 60.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // If Category Tab is selected, show CategoryScreen directly
          Positioned.fill(
            child: _currentTab == HomeNavTab.categories
                ? CategoryScreen(
                    onCategorySelected: (catId) {
                      setState(() {
                        _currentTab = HomeNavTab.home;
                      });
                      _selectCategory(catId);
                    },
                  )
                : SafeArea(
                    bottom: false,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final screenWidth = constraints.maxWidth;
                        const designWidth = 440.0;
                        final scale = screenWidth / designWidth;

                        return NotificationListener<ScrollNotification>(
                          onNotification: (notification) {
                            if (notification.metrics.axis == Axis.vertical) {
                              final maxScroll =
                                  notification.metrics.maxScrollExtent;
                              final currentScroll =
                                  notification.metrics.pixels;
                              const threshold = 400.0;
                              if (maxScroll - currentScroll <= threshold) {
                                ref
                                    .read(productFeedProvider.notifier)
                                    .loadMore();
                              }
                            }
                            return false;
                          },
                          child: SingleChildScrollView(
                            controller: _scrollController,
                            physics: const ClampingScrollPhysics(),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: screenWidth,
                                  height: designHeight * scale,
                                  child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    alignment: Alignment.topCenter,
                                    child: SizedBox(
                                      width: designWidth,
                                      height: designHeight,
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          HomeProductFeed(
                                            selectedCategoryId:
                                                _selectedCategoryId,
                                            keyword: _keyword,
                                            onClearCategory: () =>
                                                _selectCategory(null),
                                          ),
                                          HomeHeaderBar(
                                            initialKeyword: _keyword,
                                            onSearchChanged: _updateSearch,
                                            onSearchSubmitted: _updateSearch,
                                          ),
                                          HomeCategoryScrollGrid(
                                            selectedCategoryId:
                                                _selectedCategoryId,
                                            onCategorySelected: _selectCategory,
                                          ),
                                          const HomePromotionBanner(),
                                          HomeCategoryTabs(
                                            selectedCategoryId:
                                                _selectedCategoryId,
                                            onCategorySelected: _selectCategory,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                // Bottom spacing to ensure content is not covered by the floating navbar
                                const SizedBox(height: 90),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),

          // Pinned Floating Bottom Navigation Bar with New User Promo
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              top: false,
              child: Consumer(
                builder: (context, ref, child) {
                  final authStatus = ref.watch(authControllerProvider).status;
                  final showNewUserPromo =
                      authStatus == AuthStatus.signedOut ||
                      authStatus == AuthStatus.restoreFailed;

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (showNewUserPromo)
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                            bottom: 8,
                          ),
                          child: HomeNewUserPromoBar(
                            onTap: () => context.push('/login'),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Center(
                          child: HomeBottomNavBar(
                            currentIndex: _currentTab.index,
                            onTap: _onTabTapped,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
