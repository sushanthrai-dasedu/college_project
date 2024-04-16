import 'package:flutter/material.dart';

import '../../../../localization/language/languages.dart';

class CashCounterScreen extends StatefulWidget {
  const CashCounterScreen({super.key});

  @override
  State<CashCounterScreen> createState() => _CashCounterScreenState();
}

class _CashCounterScreenState extends State<CashCounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(Languages.of(context).cashCounter),
      ),
    );
  }
}
