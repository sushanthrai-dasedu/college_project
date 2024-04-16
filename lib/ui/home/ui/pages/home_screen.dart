 import 'package:cash_counter/core/const/responsive_size_consts.dart';
import 'package:cash_counter/ui/cash_counter/ui/pages/cash_counter_screen.dart';
import 'package:cash_counter/ui/home/ui/widgets/appbar.dart';
import 'package:cash_counter/ui/profile/ui/pages/profile_screen.dart';
import 'package:cash_counter/ui/receipts/ui/pages/receipts_screen.dart';
import 'package:cash_counter/ui/reports/ui/pages/reports_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/bottom_navigationbar.dart';
import '../widgets/side_navigationbar.dart';

 class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


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
                 if (constraints.maxWidth > ResponsiveSizes.mobile) {
                   if(selectedIndex == 3){
                       selectedIndex = 0;
                   }
                   // Show side navigation for web
                   return Row(
                     children: [
                      Expanded(
                        flex: 1,
                          child: AppNavigationDrawer(onTabChange: onTabChange)
                      ),
                       Expanded(
                        flex: 13,
                          child: Column(
                            children: [
                              SizedBox(
                                  height: 70.h,
                                  child: AppBarWidget(selectedIndex)
                              ),
                              getSelectedScreen(selectedIndex)
                            ],
                          )
                      ),
                     ],
                   );
                 } else {
                   // Show bottom navigation for mobile
                   return Scaffold(
                       appBar: AppBarWidget(selectedIndex),
                       body: getSelectedScreen(selectedIndex),
                       bottomNavigationBar: AppBottomNavigation(selectedIndex: selectedIndex, onTabChange: onTabChange,)
                   );
                 }
               },
             ),
           ),
         );
       }
     );
   }

  Widget getSelectedScreen(int index){
    switch(index){
      case 0:
        return CashCounterScreen();
      case 1:
        return ReceiptsScreen();
      case 2:
       return ReportsScreen();
      case 3:
        return ProfileScreen();
      default:
        return CashCounterScreen();
    }
  }




}



