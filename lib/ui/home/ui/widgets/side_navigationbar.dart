import 'package:cash_counter/ui/common/ui/widgets/app_textview.dart';
import 'package:cash_counter/ui/home/ui/widgets/side_nav_bar_item.dart';
import 'package:cash_counter/ui/theme/theme_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/const/assets_constants.dart';
import '../../../../localization/language/languages.dart';

class AppNavigationDrawer extends StatefulWidget {
  const AppNavigationDrawer({super.key, required this.onTabChange});
  final Function(int) onTabChange;

  @override
  State<AppNavigationDrawer> createState() => _AppNavigationDrawerState();
}

class _AppNavigationDrawerState extends State<AppNavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryColor,
      ),
      child: Column(
        children: [
          SizedBox(height: 50.h,),
          Image.asset(
              Assets.appLogo,
              fit: BoxFit.contain,
              width: 0.1.sw,
              height: 0.1.sh
          ),
          SizedBox(height: 50.h,),
          SideNavBarItem(
              iconPath: Assets.cashIcon,
              label: Languages.of(context).cashCounter,
              onTap: widget.onTabChange ,
              index: 0
          ),
          SizedBox(height: 35.h,),
          SideNavBarItem(
              iconPath: Assets.receiptsIcon,
              label: Languages.of(context).receipts,
              onTap: widget.onTabChange ,
              index: 1
          ),
          SizedBox(height: 35.h,),
          SideNavBarItem(
              iconPath: Assets.reportsIcon,
              label: Languages.of(context).reports,
              onTap: widget.onTabChange,
              index: 2
          ),



        ],
      ),
    );
  }
}

