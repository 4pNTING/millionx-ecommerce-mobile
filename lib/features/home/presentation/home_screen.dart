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

/// Clean, modular Home Screen with fixed responsive bottom navigation.
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;
  String? _selectedCategoryId;
  String _keyword = '';
  int _currentPage = 1;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    if (index == 0) {
      setState(() => _currentIndex = 0);
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
      return;
    }

    if (index == 1) {
      // Category tab
      setState(() => _currentIndex = 1);
      return;
    }

    if (index == 4) {
      // Profile / Account tab
      final auth = ref.read(authControllerProvider);
      if (auth.isSignedIn) {
        context.push('/account');
      } else {
        context.push('/login');
      }
      return;
    }

    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(
      productsProvider((
        keyword: _keyword,
        categoryId: _selectedCategoryId,
        page: _currentPage,
      )),
    );
    final productCount = productsAsync.asData?.value.items.length ?? 6;
    final rowCount = (productCount / 2).ceil();
    final feedHeight = 80.0 + (rowCount == 0 ? 320.0 : rowCount * 280.0) + 70.0;
    final designHeight = 570.0 + feedHeight + 60.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // If Category Tab (index 1) is selected, show CategoryScreen directly
          Positioned.fill(
            child: _currentIndex == 1
                ? CategoryScreen(
                    onCategorySelected: (catId) {
                      setState(() {
                        _selectedCategoryId = catId;
                        _currentPage = 1;
                        _currentIndex = 0;
                      });
                    },
                  )
                : SafeArea(
                    bottom: false,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final screenWidth = constraints.maxWidth;
                        const designWidth = 440.0;
                        final scale = screenWidth / designWidth;

                        return SingleChildScrollView(
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
                                          selectedCategoryId: _selectedCategoryId,
                                          keyword: _keyword,
                                          currentPage: _currentPage,
                                          onPageChanged: (newPage) {
                                            setState(() => _currentPage = newPage);
                                            if (_scrollController.hasClients) {
                                              _scrollController.animateTo(
                                                540,
                                                duration: const Duration(milliseconds: 300),
                                                curve: Curves.easeOut,
                                              );
                                            }
                                          },
                                          onClearCategory: () {
                                            setState(() {
                                              _selectedCategoryId = null;
                                              _currentPage = 1;
                                            });
                                          },
                                        ),
                                        HomeHeaderBar(
                                          initialKeyword: _keyword,
                                          onSearchChanged: (value) {
                                            setState(() {
                                              _keyword = value.trim();
                                              _currentPage = 1;
                                            });
                                          },
                                          onSearchSubmitted: (value) {
                                            setState(() {
                                              _keyword = value.trim();
                                              _currentPage = 1;
                                            });
                                          },
                                        ),
                                        HomeCategoryScrollGrid(
                                          selectedCategoryId: _selectedCategoryId,
                                          onCategorySelected: (id) {
                                            setState(() {
                                              _selectedCategoryId = id;
                                              _currentPage = 1;
                                            });
                                          },
                                        ),
                                        const HomePromotionBanner(),
                                        HomeCategoryTabs(
                                          selectedCategoryId: _selectedCategoryId,
                                          onCategorySelected: (id) {
                                            setState(() {
                                              _selectedCategoryId = id;
                                              _currentPage = 1;
                                            });
                                          },
                                        ),
                                        Positioned(
                                          left: 0,
                                          top: 504,
                                          width: 440,
                                          child: HomeNewUserPromoBar(
                                            onTap: () => context.push('/login'),
                                          ),
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
                            currentIndex: _currentIndex,
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
