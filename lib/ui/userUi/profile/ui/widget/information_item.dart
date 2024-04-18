import 'package:flutter/material.dart';
import 'package:leave_tracker/ui/theme/theme_const.dart';

import '../../../../common/ui/widgets/app_textview.dart';

class InformationItem extends StatefulWidget {
  const InformationItem({super.key});

  @override
  State<InformationItem> createState() => _InformationItemState();
}

class _InformationItemState extends State<InformationItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 220,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.only(left: 8.0,top: 4),
            child: AppTextView(minFontSize: 14, textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.primaryTextColor), text: "username"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8.0),
            child: Divider(color: Colors.grey[200],),
          ),
          Center(
            child: AppTextView(minFontSize: 14, textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.primaryTextColor), text: "sushanth"),
          ),

        ],
      ),
    );
  }
}
