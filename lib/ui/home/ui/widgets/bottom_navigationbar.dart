import 'package:cash_counter/localization/language/languages.dart';
import 'package:cash_counter/ui/theme/theme_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/const/assets_constants.dart';

class AppBottomNavigation extends StatefulWidget {
  const AppBottomNavigation({super.key, required this.selectedIndex, required this.onTabChange});

  final int selectedIndex;
  final Function(int) onTabChange;

  @override
  State<AppBottomNavigation> createState() => _AppBottomNavigationState();
}

class _AppBottomNavigationState extends State<AppBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: widget.selectedIndex,
        onTap: widget.onTabChange,
        selectedLabelStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
          color: Theme.of(context).colorScheme.white,

        ),
        unselectedLabelStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
          color: Theme.of(context).colorScheme.white,
        ),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.primaryColor,
        selectedItemColor: Theme.of(context).colorScheme.white,
        unselectedItemColor: Theme.of(context).colorScheme.white,
        items: <BottomNavigationBarItem>[
          buildBottomNavigationBarItem(iconName: Assets.cashIcon,selectedIcon: Assets.selectedCashIcon, label: Languages.of(context).cashCounter, selectedIndex: widget.selectedIndex, index: 0),
          buildBottomNavigationBarItem(iconName: Assets.receiptsIcon,selectedIcon: Assets.selectedReceiptsIcon, label: Languages.of(context).receipts, selectedIndex: widget.selectedIndex, index: 1),
          buildBottomNavigationBarItem(iconName: Assets.reportsIcon,selectedIcon: Assets.selectedReportsIcon, label: Languages.of(context).reports, selectedIndex: widget.selectedIndex, index: 2),
          buildBottomNavigationBarItem(iconName: Assets.profileIcon,selectedIcon: Assets.selectedProfileIcon, label: Languages.of(context).profile, selectedIndex: widget.selectedIndex, index: 3),

        ],
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({required String iconName, required String selectedIcon, required String label, required int selectedIndex, required int index}) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(bottom: 3.0),
        child: Image.asset(
          iconName,
          height: 20,
          color: Theme.of(context).colorScheme.white,

        ),
      ),
      activeIcon: Image.asset(
        selectedIcon,
        height: 25,
      ),
      label: label,
    );
  }
}