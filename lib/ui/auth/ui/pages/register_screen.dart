import 'package:bot_toast/bot_toast.dart';
import 'package:cash_counter/core/di/service_locator.dart';
import 'package:cash_counter/ui/auth/cubit/registration_cubit.dart';
import 'package:cash_counter/ui/theme/theme_const.dart';
import 'package:cash_counter/utility/form_validators.dart';
import 'package:cash_counter/utility/view_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../core/Router/navigator.dart';
import '../../../../core/const/assets_constants.dart';
import '../../../../core/const/responsive_size_consts.dart';
import '../../../../localization/language/languages.dart';
import '../../../common/ui/widgets/app_textview.dart';
import '../widgets/auth_container.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  FocusNode userFocusNode = FocusNode();
  FocusNode passWordFocusNode = FocusNode();
  bool obscureText = true;

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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

  void register(String userName, String password) async {
    Map userDetails = {"username": userName, "password": password};
    await serviceLocator<RegistrationCubit>().registerDevice(userDetails);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      var width = constraint.maxWidth;

      double topMargin = 0.1.sh;
      if (width <= ResponsiveSizes.mobile) {
        topMargin = 0.05.sh;
      }

      return SafeArea(
          child: Scaffold(
        body: BlocConsumer<RegistrationCubit, RegistrationState>(
          listener: (context, state) {
            if(state is RegistrationInProgress){
              // ViewUtils.showLoaderDialog(context, Languages.of(context).registrationInProgress);
              BotToast.showLoading();
            }
            if(state is RegistrationFailed){
              BotToast.closeAllLoading();
              // Navigator.pop(context); //dismiss loader
              // Fluttertoast.showToast(msg: state.message);
              BotToast.showText(text: state.message);
            }

            if(state is RegistrationSuccessful){
              // Navigator.pop(context); //dismiss loader
              Navigator.popAndPushNamed(context, Routes.homePage);
            }



          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Image.asset(Assets.loginBg,
                      fit: BoxFit.fill, width: 1.sw, height: 0.5.sh),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: topMargin),
                      child: Column(
                        children: [
                          Image.asset(Assets.appLogo,
                              fit: BoxFit.contain,
                              width: 0.2.sw,
                              height: 0.2.sh),
                          AuthContainer(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  AppTextView(
                                    text: Languages.of(context).registerDevice,
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primaryColor),
                                    minFontSize: 20,
                                    textAlign: TextAlign.center,
                                  ),

                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    // Set a fixed width for the container
                                    child: SizedBox(
                                      child: TextFormField(
                                        focusNode: userFocusNode,
                                        controller: userNameController,
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
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

                                  SizedBox(
                                    height: 30.h,
                                  ),

                                  Container(
                                    width: 300,
                                    child: InkWell(
                                      onTap: () {
                                        if (_formKey.currentState!.validate()) {
                                          //validate form

                                          //call register cubit function
                                          register(userNameController.value.text,
                                              passwordController.value.text);
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        padding: EdgeInsets.all(15.r),
                                        child: AppTextView(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .labelSmall!
                                              .copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .white),
                                          text: Languages.of(context)
                                              .registerDevice,
                                          minFontSize: 14,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ));
    });
  }
}
