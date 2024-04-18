import '../../../../../core/const/responsive_size_consts.dart';
import '../../../../../localization/language/languages.dart';
import '../../../../../utility/view_utility.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../localization/language/languages.dart';
import '../ui/common/ui/widgets/app_textview.dart';

class ViewUtils {
  static String getScreenName(int index, BuildContext context) {
    switch (index) {
      case 0:
        return Languages.of(context).userHome;
      case 1:
        return Languages.of(context).userHolidayList;
      case 2:
        return Languages.of(context).userLeaveApply;
      case 3:
        return Languages.of(context).userProfile;
      default:
        return Languages.of(context).userHome;
    }
  }

  static showLoaderDialog(BuildContext context, String title) {
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      content: Container(
        height: 40.0,
          width: 200.0,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5.0)
          ),
        child: Center(
          child: SizedBox(
            height: 50.0,
            child: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 10.0),
                Container(

                    child: AppTextView(
                  text: title,
                  textStyle: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                  minFontSize: 12.0,
                )),
              ],
            ),
          ),
        ),
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
