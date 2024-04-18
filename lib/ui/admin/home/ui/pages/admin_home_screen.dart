
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leave_tracker/ui/userUi/applyLeave/ui/pages/leave_apply_screen.dart';
import 'package:leave_tracker/ui/userUi/frontScreen/ui/pages/front_screen.dart';
import 'package:leave_tracker/ui/userUi/holidayList/ui/pages/holidayList_screen.dart';
import 'package:leave_tracker/ui/userUi/profile/ui/pages/user_profile_screen.dart';

import '../widgets/admin_appbar.dart';
import '../widgets/admin_bottom_navigationbar.dart';



class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {


  int selectedIndex=0;

  void onTabChange(int index){
    print(index);
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(
        builder: (context, constraints) {
          return SafeArea(
            child: Scaffold(
              body: LayoutBuilder(
                  builder: (context, constraints) {
                    // Show bottom navigation for mobile
                    return Scaffold(
                        appBar: AdminAppBarWidget(selectedIndex),
                        body: getSelectedScreen(selectedIndex),
                        bottomNavigationBar: AdminAppBottomNavigation(selectedIndex: selectedIndex, onTabChange: onTabChange,)
                    );
                  }
              ),
            ),
          );
        }
    );
  }

  Widget getSelectedScreen(int index){
    switch(index){
      case 0:
        return FrontScreen();
      case 1:
        return HolidayListScreen();
      case 2:
        return LeaveApplyScreen();
      case 3:
        return UserProfileScreen();
      default:
        return FrontScreen();
    }
  }




}



