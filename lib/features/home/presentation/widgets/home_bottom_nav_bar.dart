import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class _NavItem {
  const _NavItem({required this.iconAsset, required this.label});

  final String iconAsset;
  final String label;
}

/// Floating bottom navigation bar for MillionX mobile storefront.
class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({super.key, this.currentIndex = 0, this.onTap});

  final int currentIndex;
  final ValueChanged<int>? onTap;

  static const List<_NavItem> _items = [
    _NavItem(iconAsset: 'assets/icons/home_icon.png', label: 'ຫນ້າຫລັກ'),
    _NavItem(iconAsset: 'assets/icons/catagories_icon.png', label: 'ໝວດໝູ່'),
    _NavItem(iconAsset: 'assets/icons/cart_icon.png', label: 'ໂປຣໂມຊັ່ນ'),
    _NavItem(iconAsset: 'assets/icons/chat_icon.png', label: 'ແຊ໊ດ'),
    _NavItem(iconAsset: 'assets/icons/profile_icon.png', label: 'ໂປຮໄຟຣ'),
  ];

  @override
  Widget build(BuildContext context) {
    final activeIndex = currentIndex.clamp(0, _items.length - 1).toInt();
    final availableWidth = (MediaQuery.sizeOf(context).width - 16)
        .clamp(0.0, 309.0)
        .toDouble();

    return Container(
      width: availableWidth,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 5,
            offset: Offset.zero,
            spreadRadius: 1,
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final itemScale = ((constraints.maxWidth - 30) / 267)
              .clamp(0.0, 1.0)
              .toDouble();
          final itemGap = (constraints.maxWidth - 10 - 267 * itemScale) / 4;
          final activeLeft = 5 + activeIndex * (40 * itemScale + itemGap);

          return Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              AnimatedPositioned(
                key: const ValueKey('active-nav-item'),
                duration: const Duration(milliseconds: 260),
                curve: Curves.easeOutCubic,
                left: activeLeft,
                top: 5,
                width: 107 * itemScale,
                height: 40,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => onTap?.call(activeIndex),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFB255A),
                      borderRadius: BorderRadius.circular(30 * itemScale),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 40 * itemScale,
                          height: 40,
                          child: Center(
                            child: SvgPicture.asset(
                              _items[activeIndex].iconAsset.replaceFirst(
                                '.png',
                                '.svg',
                              ),
                              width: 20 * itemScale,
                              height: 20 * itemScale,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12 * itemScale),
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 180),
                              switchInCurve: Curves.easeOut,
                              switchOutCurve: Curves.easeIn,
                              transitionBuilder: (child, animation) =>
                                  FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  ),
                              child: Align(
                                key: ValueKey(activeIndex),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  _items[activeIndex].label,
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12 * itemScale,
                                    height: 1,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              for (var index = 0; index < _items.length; index++)
                if (index != activeIndex)
                  _buildInactiveItem(index, activeIndex, itemScale, itemGap),
            ],
          );
        },
      ),
    );
  }

  Widget _buildInactiveItem(
    int index,
    int activeIndex,
    double itemScale,
    double itemGap,
  ) {
    final item = _items[index];
    final itemLeft = index < activeIndex
        ? 5 + index * (40 * itemScale + itemGap)
        : 5 +
              activeIndex * (40 * itemScale + itemGap) +
              107 * itemScale +
              itemGap +
              (index - activeIndex - 1) * (40 * itemScale + itemGap);

    return AnimatedPositioned(
      key: ValueKey('nav-item-$index'),
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOutCubic,
      left: itemLeft,
      top: 5,
      width: 40 * itemScale,
      height: 40,
      child: Semantics(
        button: true,
        selected: false,
        label: item.label,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => onTap?.call(index),
          child: Center(
            child: SvgPicture.asset(
              item.iconAsset.replaceFirst('.png', '.svg'),
              width: 20 * itemScale,
              height: 20 * itemScale,
              colorFilter: const ColorFilter.mode(
                Color(0xFF151515),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
