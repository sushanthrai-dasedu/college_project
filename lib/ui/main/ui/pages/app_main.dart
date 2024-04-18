import 'package:flutter/material.dart';

import '../../../auth/ui/pages/login_screen.dart';

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
