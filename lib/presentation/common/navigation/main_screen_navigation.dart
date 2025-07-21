import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/style/app_colors.dart';
import 'package:moviealike/presentation/constants/app_svgs.dart';

class MainScreenNavigation extends StatefulWidget {
  const MainScreenNavigation({
    super.key,
    required this.child,
  });

  final StatefulNavigationShell child;

  @override
  State<MainScreenNavigation> createState() => _MainScreenNavigationState();
}

class _MainScreenNavigationState extends State<MainScreenNavigation> {
  late final List<_NavItem> _navItems = [
    _NavItem(
      label: context.text.home,
      iconAsset: AppSvgs.homeIcon,
    ),
    _NavItem(
      label: context.text.search,
      iconAsset: AppSvgs.searchIcon,
    ),
    _NavItem(
      label: context.text.watchlist,
      iconAsset: AppSvgs.heartIcon,
    ),
    _NavItem(
      label: context.text.about,
      iconAsset: AppSvgs.questionMarkIcon,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
          child: widget.child,
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            color: AppColors.primary, // Background color from the images
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _navItems.mapIndexed((index, item) {
                final bool isSelected = index == widget.child.currentIndex;
                return InkWell(
                  onTap: () {
                    widget.child.goBranch(
                      index,
                      initialLocation: index == widget.child.currentIndex,
                    );
                    setState(() {});
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color:
                          isSelected ? AppColors.secondary : AppColors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          item.iconAsset,
                          colorFilter: ColorFilter.mode(
                              isSelected ? AppColors.accent : AppColors.grey,
                              BlendMode.srcIn),
                          width: 24,
                        ),
                        if (isSelected)
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              item.label,
                              style: const TextStyle(
                                color: AppColors.accent,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ));
  }
}

class _NavItem {
  final String label;
  final String iconAsset;

  _NavItem({required this.label, required this.iconAsset});
}
