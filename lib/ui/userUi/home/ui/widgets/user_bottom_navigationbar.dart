
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leave_tracker/ui/theme/theme_const.dart';

import '../../../../../core/const/assets_constants.dart';
import '../../../../../localization/language/languages.dart';


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
    return  Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 20),
          ],
        ),
        child: ClipRRect(

        borderRadius: BorderRadius.circular(8),

    child:BottomNavigationBar(
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
          buildBottomNavigationBarItem(iconName: Assets.cashIcon,selectedIcon: Assets.selectedCashIcon, label: Languages.of(context).userHome, selectedIndex: widget.selectedIndex, index: 0),
          buildBottomNavigationBarItem(iconName: Assets.receiptsIcon,selectedIcon: Assets.selectedReceiptsIcon, label: Languages.of(context).userHolidayList, selectedIndex: widget.selectedIndex, index: 1),
          buildBottomNavigationBarItem(iconName: Assets.reportsIcon,selectedIcon: Assets.selectedReportsIcon, label: Languages.of(context).userLeaveApply, selectedIndex: widget.selectedIndex, index: 2),
          buildBottomNavigationBarItem(iconName: Assets.profileIcon,selectedIcon: Assets.selectedProfileIcon, label: Languages.of(context).userProfile, selectedIndex: widget.selectedIndex, index: 3),

        ],
    ),
        )
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