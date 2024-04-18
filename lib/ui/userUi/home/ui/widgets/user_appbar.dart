
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leave_tracker/ui/theme/theme_const.dart';

import '../../../../../core/const/responsive_size_consts.dart';
import '../../../../../localization/language/languages.dart';
import '../../../../../utility/view_utility.dart';
import '../../../../common/ui/widgets/app_textview.dart';
import '../../../../common/ui/widgets/dropdown_menu.dart';


class AppBarWidget extends AppBar {
   AppBarWidget(this.selectedScreenIndex, {super.key});
  final int selectedScreenIndex;


  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context,constraints) {
        bool isMobile = constraints.maxWidth <= ResponsiveSizes.mobile;

        return Material(
          elevation: 1,
          shadowColor: Theme.of(context).colorScheme.white,
          child: Container(
            margin: EdgeInsets.only(left: 15.w),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.grey,
                        shape: BoxShape.circle
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Theme.of(context).colorScheme.grey,
                    ),
                  ),
                ),
                Spacer(),
                AppTextView(
                  text: ViewUtils.getScreenName(widget.selectedScreenIndex,context),
                  minFontSize: isMobile ? 16: 24,
                  textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primaryColor
                  ),
                ),

                Spacer(),




                  SizedBox(width: 20,),

                  Container(
                    width: 100,
                    height: 30.0,
                    child: SizedBox(
                        height: 30,
                        child: AppLanguageDropDown()
                    ),
                  ),

                  SizedBox(width: 20),


                ],
                // Language dropdown


            ),
          ),
        );
      }
    );
  }

}
