
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leave_tracker/ui/theme/theme_const.dart';

import '../../../../../core/Router/navigator.dart';
import '../../../../../core/const/assets_constants.dart';
import '../../../../../core/const/responsive_size_consts.dart';
import '../../../../../localization/language/languages.dart';
import '../../../../../utility/form_validators.dart';
import '../../../../auth/ui/widgets/auth_container.dart';
import '../../../../common/ui/widgets/app_textview.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  FocusNode userFocusNode =  FocusNode();
  FocusNode passWordFocusNode =  FocusNode();
  bool obscureText = true;


  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  void initState() {
    super.initState();
    userFocusNode = FocusNode();
    userFocusNode.addListener(() {
      setState(() {});
    });
    passWordFocusNode = FocusNode();
    passWordFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    userFocusNode.dispose();
    passWordFocusNode.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

        return SafeArea(
            child: Column(
              children: [
                SizedBox(height: 30.h,),
                SizedBox(
                  width: 300,
                  // Set a fixed width for the container
                  child: SizedBox(
                    child: TextFormField(
                      focusNode: userFocusNode,
                      controller: userNameController,
                      decoration: InputDecoration(
                        labelText:
                        Languages.of(context).userName,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .primaryColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .grey,
                            width: 2.0,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .red,
                            width: 2.0,
                          ),
                        ),

                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .red,
                            width: 2.0,
                          ),
                        ),
                        labelStyle: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                          color: userFocusNode.hasFocus
                              ? Theme.of(context)
                              .colorScheme
                              .primaryColor
                              : Theme.of(context)
                              .colorScheme
                              .primaryTextColor,
                          fontSize: 16,
                        ),
                        errorStyle: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                          color:Theme.of(context)
                              .colorScheme
                              .red,
                          fontSize: 14,
                        ),
                      ),
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(
                        fontSize: 16,
                      ),
                      validator: (value) =>
                          AppFormFieldValidator
                              .validateUserName(value,context),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                //password
                Container(
                  width: 300,
                  // Set a fixed width for the container
                  child: SizedBox(
                    child: TextFormField(
                      focusNode: passWordFocusNode,
                      controller: passwordController,
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        labelText:
                        Languages.of(context).password,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: obscureText
                                ? Theme.of(context)
                                .colorScheme
                                .grey
                                : Theme.of(context)
                                .colorScheme
                                .primaryColor,
                          ),
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .primaryColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .grey,
                            width: 2.0,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .red,
                            width: 2.0,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .red,
                            width: 2.0,
                          ),
                        ),
                        labelStyle: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                          color: passWordFocusNode.hasFocus
                              ? Theme.of(context)
                              .colorScheme
                              .primaryColor
                              : Theme.of(context)
                              .colorScheme
                              .primaryTextColor,
                          fontSize: 16,
                        ),
                        errorStyle: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                          color:Theme.of(context)
                              .colorScheme
                              .red,
                          fontSize: 14,
                        ),
                      ),
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(
                        fontSize: 16,
                      ),
                      validator: (value) =>
                          AppFormFieldValidator
                              .validatePassword(value,context),
                    ),
                  ),
                ),


                SizedBox(height: 30.h,),



                Container(
                  width: 300,
                  child: InkWell(
                    onTap: (){
                      //Navigator.popAndPushNamed(context, Routes.);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding: EdgeInsets.all(15.r),
                      child: AppTextView(

                        textStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Theme.of(context).colorScheme.white
                        ),
                        text: Languages.of(context).login,
                        minFontSize: 14,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),

              ],
            )





        );

      }

  }

