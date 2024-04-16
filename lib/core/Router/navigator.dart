

import 'package:cash_counter/ui/auth/ui/pages/login_screen.dart';
import 'package:cash_counter/ui/auth/ui/pages/register_screen.dart';
import 'package:cash_counter/ui/home/ui/pages/home_screen.dart';
import 'package:cash_counter/ui/main/ui/pages/app_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes{

  static const String homePage = "/home";
  static const String loginPage ="/login";
  static const String registrationPage ="/registration";

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case homePage:
        return MaterialPageRoute(
            builder: (context) => HomeScreen(),
          settings: RouteSettings(name: homePage)
        );

      case loginPage:
        return MaterialPageRoute(
            builder: (context )=>LoginScreen(),
          settings: RouteSettings(name:  loginPage)
        );

      case registrationPage:
        return MaterialPageRoute(
            builder: (context )=>RegisterScreen(),
          settings: RouteSettings(name:  registrationPage)
        );

      default:
        return MaterialPageRoute(
            builder: (context) => AppMain(),
          settings: RouteSettings(name:  loginPage)
        );


    }
  }
}