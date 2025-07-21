import 'package:flutter/material.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/style/app_colors.dart';

class CustomBottomNavBar extends StatefulWidget {
  final String currentRoute;
  const CustomBottomNavBar({Key? key, required this.currentRoute})
      : super(key: key);

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  late final List<_NavItem> _navItems = [
    _NavItem(label: context.text.home, icon: Icons.home, route: '/'),
    _NavItem(label: context.text.search, icon: Icons.search, route: '/search'),
    _NavItem(
        label: context.text.watchlist,
        icon: Icons.bookmark,
        route: '/watchlist'),
    _NavItem(label: context.text.about, icon: Icons.help, route: '/settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        color: AppColors.primary, // Background color from the images
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _navItems.map((item) {
            final bool isSelected = widget.currentRoute == item.route;
            return InkWell(
              onTap: () {},
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.secondary : AppColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      item.icon,
                      color: isSelected ? AppColors.accent : AppColors.grey,
                      size: 24,
                    ),
                    if (isSelected)
                      AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: Padding(
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
                      ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _NavItem {
  final String label;
  final IconData icon;
  final String route;

  _NavItem({required this.label, required this.icon, required this.route});
}
