import 'package:cash_counter/core/const/responsive_size_consts.dart';
import 'package:cash_counter/localization/language/languages.dart';
import 'package:cash_counter/ui/common/ui/widgets/app_textview.dart';
import 'package:cash_counter/ui/theme/theme_const.dart';
import 'package:cash_counter/utility/view_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/ui/widgets/dropdown_menu.dart';

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
                AppTextView(
                  text: ViewUtils.getScreenName(widget.selectedScreenIndex,context),
                  minFontSize: isMobile ? 16: 24,
                  textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primaryColor
                  ),
                ),

                Spacer(),


                Container(
                  padding: isMobile ? EdgeInsets.symmetric(vertical: 10.0) : EdgeInsets.symmetric(vertical: 5.0),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: AppTextView(
                      text: Languages.of(context).closeCashCounter,
                      textStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Theme.of(context).colorScheme.primaryColor),
                      minFontSize: 10,
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.primaryColor
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.r))
                      )
                    )
                  ),
                ),


                if(!isMobile)...[
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

                  Container(
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
                ],
                SizedBox(width: 15,),
                // Language dropdown
              ],

            ),
          ),
        );
      }
    );
  }

}
