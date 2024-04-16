import 'package:cash_counter/ui/theme/theme_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/ui/widgets/app_textview.dart';

class SideNavBarItem extends StatefulWidget {
  const SideNavBarItem({super.key, required this.iconPath, required this.label, required this.onTap, required this.index});
  final String iconPath;
  final String label;
  final Function(int) onTap;
  final int index;

  @override
  State<SideNavBarItem> createState() => _SideNavBarItemState();
}

class _SideNavBarItemState extends State<SideNavBarItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.onTap(widget.index);
      },
      child: Column(
        children: [
          Image.asset(
              widget.iconPath,
              fit: BoxFit.contain,
              width: 0.03.sw,
              height: 0.03.sh
          ),
          SizedBox(height: 15.h,),
          AppTextView(
            minFontSize: 10,
            textStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Theme.of(context).colorScheme.white
            ),
            text: widget.label,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
