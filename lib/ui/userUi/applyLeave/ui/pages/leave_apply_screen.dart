import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leave_tracker/ui/theme/theme_const.dart';
import 'package:leave_tracker/ui/userUi/applyLeave/ui/widget/date_selector.dart';

import '../../../../common/ui/widgets/app_textview.dart';

class LeaveApplyScreen extends StatefulWidget {
  const LeaveApplyScreen({super.key});

  @override
  State<LeaveApplyScreen> createState() => _LeaveApplyScreenState();
}

class _LeaveApplyScreenState extends State<LeaveApplyScreen> {
  String? typeofholiday;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 40, left: 15, right: 15, bottom: 40),
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.black26, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: Column(children: [
              AppTextView(
                  minFontSize: 14,
                  textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primaryColor),
                  text: "Apply for leave"),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Theme(
                    data: ThemeData(
                      unselectedWidgetColor: Theme.of(context).primaryColor,
                    ),
                    child: Radio<String>(
                      activeColor: Theme.of(context).primaryColor,
                      value: "function",
                      groupValue: typeofholiday,
                      onChanged: (value) {
                        setState(() {
                          typeofholiday = value;
                        });
                      },
                    ),
                  ),
                  Text('Function'),
                  Theme(
                    data: ThemeData(
                      unselectedWidgetColor: Theme.of(context).primaryColor,
                    ),
                    child: Radio<String>(
                      activeColor: Theme.of(context).primaryColor,
                      value: "sick",
                      groupValue: typeofholiday,
                      onChanged: (value) {
                        setState(() {
                          typeofholiday = value;
                        });
                      },
                    ),
                  ),
                  Text('Sick'),
                ],
              ),
      
              SizedBox(
                height: 10,
              ),
              Theme(
                data: ThemeData(
                    unselectedWidgetColor: Theme.of(context).primaryColor),
                child: CheckboxListTile(
                  activeColor: Theme.of(context).primaryColor,
                  title: AppTextView(
                    minFontSize: 14,
                    textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primaryTextColor,
                        ),
                    text: "single day holiday?",
                  ),
                  value: timeDilation != 1.0,
                  onChanged: (bool? value) {
                    setState(() {
                      timeDilation = value! ? 3.0 : 1.0;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
      
      DateSelector(Datefeildname: "From Date", validatortext: "Please Enter Date"),
              SizedBox(
                height: 10,
              ),
      
              DateSelector(Datefeildname: "To Date", validatortext: "Please Enter Date"),
              SizedBox(
                height: 10,
              ),
              AppTextView(
                  minFontSize: 20,
                  textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primaryTextColor),
                  text: "Reason"),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primaryTextColor,
                      width: 2.0,
                    ),
                  ),
                    focusedBorder: UnderlineInputBorder(

                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primaryColor,
                        width: 2.0,
                      ),
                    )
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(

                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextButton(onPressed: (){}, child: AppTextView(minFontSize: 14, textStyle:

                Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.white), text: 'Apply for Leave',

                )),
              )
            ])),
      ),
    );
  }
}
