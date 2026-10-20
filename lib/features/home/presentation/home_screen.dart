import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../auth/presentation/auth_providers.dart';
import '../../auth/presentation/auth_controller.dart';
import 'widgets/home_bottom_nav_bar.dart';
import 'widgets/home_category_scroll_grid.dart';
import 'widgets/home_category_tabs.dart';
import 'widgets/catagories_sub_hierachy_show.dart';
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
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);
  final ValueNotifier<int> _categoryPageNotifier = ValueNotifier<int>(0);
  final ValueNotifier<bool> _showFoodHierarchy = ValueNotifier<bool>(false);
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    _currentIndex.dispose();
    _categoryPageNotifier.dispose();
    _showFoodHierarchy.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    if (index == 0) {
      _currentIndex.value = 0;
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
      return;
    }

    if (index == 4) {
      // Profile / Account tab
      _currentIndex.value = 4;
      final auth = ref.read(authControllerProvider);
      if (auth.isSignedIn) {
        context.push('/account');
      } else {
        context.push('/login');
      }
      return;
    }

    _currentIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Scrollable Home Content
          Positioned.fill(
            child: SafeArea(
              bottom: false,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final screenWidth = constraints.maxWidth;
                  const designWidth = 440.0;
                  const designHeight = 1960.0;
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
                                  ValueListenableBuilder<bool>(
                                    valueListenable: _showFoodHierarchy,
                                    builder:
                                        (context, showFoodHierarchy, child) {
                                          if (showFoodHierarchy) {
                                            return const SizedBox.shrink();
                                          }
                                          return ValueListenableBuilder<int>(
                                            valueListenable:
                                                _categoryPageNotifier,
                                            builder:
                                                (
                                                  context,
                                                  categoryPage,
                                                  child,
                                                ) => HomeProductFeed(
                                                  topOffset: categoryPage == 1
                                                      ? 78
                                                      : 0,
                                                ),
                                          );
                                        },
                                  ),
                                  const HomeHeaderBar(),
                                  ValueListenableBuilder<bool>(
                                    valueListenable: _showFoodHierarchy,
                                    builder:
                                        (context, showFoodHierarchy, child) {
                                          if (showFoodHierarchy) {
                                            return const SizedBox.shrink();
                                          }
                                          return HomeCategoryScrollGrid(
                                            onPageChanged: (page) {
                                              _categoryPageNotifier.value =
                                                  page;
                                            },
                                          );
                                        },
                                  ),
                                  ValueListenableBuilder<bool>(
                                    valueListenable: _showFoodHierarchy,
                                    builder:
                                        (context, showFoodHierarchy, child) {
                                          if (showFoodHierarchy) {
                                            return const SizedBox.shrink();
                                          }
                                          return ValueListenableBuilder<int>(
                                            valueListenable:
                                                _categoryPageNotifier,
                                            builder:
                                                (
                                                  context,
                                                  categoryPage,
                                                  child,
                                                ) => HomePromotionBanner(
                                                  topOffset: categoryPage == 1
                                                      ? 83
                                                      : 5,
                                                ),
                                          );
                                        },
                                  ),
                                  ValueListenableBuilder<bool>(
                                    valueListenable: _showFoodHierarchy,
                                    builder:
                                        (context, showFoodHierarchy, child) {
                                          if (!showFoodHierarchy) {
                                            return const SizedBox.shrink();
                                          }
                                          return const Positioned(
                                            left: 0,
                                            top: 183,
                                            child: CategoriesSubHierarchyShow(),
                                          );
                                        },
                                  ),
                                  HomeCategoryTabs(
                                    onCategorySelected: (category) {
                                      _showFoodHierarchy.value =
                                          category == 'ອາຫານ';
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Bottom spacing to ensure content is not covered by the floating navbar
                        const SizedBox(height: 170),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          // Pinned Floating Bottom Navigation Bar
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
                          child: ValueListenableBuilder<int>(
                            valueListenable: _currentIndex,
                            builder: (context, currentIndex, child) =>
                                HomeBottomNavBar(
                                  currentIndex: currentIndex,
                                  onTap: _onTabTapped,
                                ),
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
