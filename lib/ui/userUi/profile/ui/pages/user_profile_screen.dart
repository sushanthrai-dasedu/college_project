import 'package:flutter/material.dart';
import 'package:leave_tracker/ui/common/ui/widgets/app_textview.dart';
import 'package:leave_tracker/ui/theme/theme_const.dart';
import 'package:leave_tracker/ui/userUi/profile/ui/widget/information_item.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(40),
    child: Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.greyLight,
      ),
child: Column(
  children: [
    Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20,left: 20,top: 20,bottom: 20),
          child: CircleAvatar(
            radius: 35,
            backgroundColor: Theme.of(context).colorScheme.greyveryLight,
          ),
        ),

        SizedBox(width: 5,),
        AppTextView(minFontSize: 20, textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: Theme.of(context).colorScheme.primaryColor),text: "hii hello"),
      ],
    ),
    SizedBox(height: 10,),
    InformationItem(),
      SizedBox(height: 30,),
    InformationItem(),
    SizedBox(height: 30,),
    InformationItem(),
    SizedBox(height: 30,),
    InformationItem(),

  ],
),

    ),
    );
  }
}
