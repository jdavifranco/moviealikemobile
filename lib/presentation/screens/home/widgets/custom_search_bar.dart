import 'package:flutter/material.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/style/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onFilterPressed;
  final ValueChanged<String> onChanged;
  final VoidCallback? onTap;
  const CustomSearchBar({
    Key? key,
    required this.controller,
    required this.onFilterPressed,
    required this.onChanged,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.secondary, // Background color
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          const Icon(
            Icons.search,
            color: AppColors.grey,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              onTap: onTap,
              controller: controller,
              onChanged: onChanged,
              style: const TextStyle(color: AppColors.grey, fontSize: 16),
              decoration: InputDecoration(
                hintText: context.text.searchHint,
                hintStyle: TextStyle(color: AppColors.grey, fontSize: 16),
                border: InputBorder.none,
              ),
            ),
          ),
          // const VerticalDivider(
          //   color: Colors.white24,
          //   width: 1,
          //   indent: 12,
          //   endIndent: 12,
          //   thickness: 1,
          // ),
          // IconButton(
          //   icon: const Icon(Icons.tune, color: Colors.white),
          //   onPressed: onFilterPressed,
          // ),
        ],
      ),
    );
  }
}
