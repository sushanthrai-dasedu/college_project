import 'package:cash_counter/ui/theme/theme_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/const/responsive_size_consts.dart';

class AuthContainer extends StatefulWidget {
  const AuthContainer({super.key, required this.child});

  final Widget child;

  @override
  State<AuthContainer> createState() => _AuthContainerState();
}

class _AuthContainerState extends State<AuthContainer> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        var padding = width * 0.1;
        double horizontalMargin = width * 0.06;
        double topMargin = 0.1.sh;

        var boxWidth = width * 0.8;

        if(width <= ResponsiveSizes.mobile){
          topMargin = 0.05.sh;
          padding = width * 0.1;
          horizontalMargin = width * 0.06;
          boxWidth = width * 0.8;
        }else if(width <= ResponsiveSizes.tablet){
          padding = width * 0.06;
          horizontalMargin = width * 0.25;
          boxWidth = width * 0.5;
        }else{
          padding = width * 0.04;
          horizontalMargin = width * 0.3;
          boxWidth = width * 0.4;
        }

        return Container(
          margin: EdgeInsets.only(top: topMargin,left: horizontalMargin, right: horizontalMargin),
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).colorScheme.greyLight,
                      blurRadius: 1.r,
                      spreadRadius: 0.3.r,
                    offset: Offset(1, 5)
                  )
                ],
                color: Theme.of(context).colorScheme.white
            ),

            child: widget.child,
        );
      },
    );
  }
}
