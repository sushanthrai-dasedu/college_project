


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ui/auth/ui/pages/login_screen.dart';
import '../../ui/main/ui/pages/app_main.dart';
import '../../ui/userUi/home/ui/pages/user_home_screen.dart';

class Routes{

  static const String userHomePage = "/user_home";
  static const String loginPage ="/login";
  static const String registrationPage ="/registration";

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case userHomePage:
        return MaterialPageRoute(
            builder: (context) => UserHomeScreen(),
          settings: RouteSettings(name: userHomePage)
        );

      case loginPage:
        return MaterialPageRoute(
            builder: (context )=>LoginScreen(),
          settings: RouteSettings(name:  loginPage)
        );

      // case registrationPage:
      //   return MaterialPageRoute(
      //       builder: (context )=>RegisterScreen(),
      //     settings: RouteSettings(name:  registrationPage)
      //   );

      default:
        return MaterialPageRoute(
            builder: (context) => AppMain(),
          settings: RouteSettings(name:  loginPage)
        );


    }
  }
}