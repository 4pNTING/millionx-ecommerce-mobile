import 'package:flutter/material.dart';
import 'widgets/home_bottom_nav_bar.dart';
import 'widgets/home_category_scroll_grid.dart';
import 'widgets/home_category_tabs.dart';
import 'widgets/home_header_bar.dart';
import 'widgets/home_new_user_promo_bar.dart';
import 'widgets/home_product_feed.dart';
import 'widgets/home_promotion_banner.dart';

/// Clean, modular Home Screen for the application.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            const designWidth = 440.0;
            const designHeight = 1960.0;
            final scale = screenWidth / designWidth;
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: SizedBox(
                width: screenWidth,
                height: designHeight * scale,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                  child: const SizedBox(
                    width: designWidth,
                    height: designHeight,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        HomeProductFeed(),
                        HomeHeaderBar(),
                        HomeCategoryScrollGrid(),
                        HomePromotionBanner(),
                        HomeCategoryTabs(),
                        HomeNewUserPromoBar(),
                        HomeBottomNavBar(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
