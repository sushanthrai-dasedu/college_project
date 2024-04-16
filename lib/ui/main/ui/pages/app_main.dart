import 'package:cash_counter/responsive.dart';
import 'package:cash_counter/ui/auth/ui/pages/login_screen.dart';
import 'package:flutter/material.dart';

import '../../../home/ui/pages/home_screen.dart';

class AppMain extends StatefulWidget {
  const AppMain({super.key});

  @override
  State<AppMain> createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {
  @override
  Widget build(BuildContext context) {
   return LoginScreen();
  }
}
