import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:save_money/types/types.dart';
import 'package:save_money/utils/constant.dart';

typedef OnTapWithIndex = void Function(int index);

class CustomBottomNav extends StatelessWidget {
  final AppColors appColors;
  final int currentIndex;
  final OnTapWithIndex onTap;
  const CustomBottomNav(
      {super.key,
      required this.appColors,
      required this.currentIndex,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: appColors.themeColor,
        items: List.generate(bottomOptions.length, (index) {
          final option = bottomOptions[index];
          return BottomNavigationBarItem(
              backgroundColor: appColors.primaryColor,
              icon: Icon(option["icon"] ?? LucideIcons.x),
              label: option["label"] ?? "No Label");
        }));
  }
}
