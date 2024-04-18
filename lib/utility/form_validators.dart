import '../../../../../core/const/responsive_size_consts.dart';
import '../../../../../localization/language/languages.dart';
import '../../../../../utility/view_utility.dart';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
class AppFormFieldValidator {
  static String? validateEmail({String? value, bool required = true}) {
    if (!required && (value != null && value.isEmpty)) {
      return null;
    }
    Pattern pattern = r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$';
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value ?? '')) {
      return 'Enter valid email';
    } else {
      return null;
    }
  }

  static String? validateMobile({String? value, bool required = true}) {
    if (!required && (value != null && value.isEmpty)) {
      return null;
    }
    Pattern numPattern = r'^[0-9]{10}$';
    RegExp regex = RegExp(numPattern.toString());
    if (!regex.hasMatch(value ?? '')) {
      return 'Enter valid phone number';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? value,BuildContext context) {
    //strong password identification pattern
    // Pattern pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

    // RegExp regex = RegExp(pattern.toString());
    if(value == null || value.isEmpty){
      return Languages.of(context).pleaseEnterPassword;
    }
    //for pattern mathching
    // if (!regex.hasMatch(value)) {
    //   return 'Weak Password';
    // }

    else {
      return null;
    }
  }
  static String? validateUserName(String? value,BuildContext context) {
    //update this based on the requirement
    if(value == null || value.isEmpty){
      return Languages.of(context).pleaseEnterUserName;
    }else {
      return null;
    }

  }

  static String? validateName(String? value) {
    Pattern pattern = r'^[a-zA-Z]+([\ A-Za-z]+)*$';
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value ?? '')) {
      return 'Enter Valid Name';
    } else {
      return null;
    }
  }

  static String? validateIfscCode(String? value) {
    Pattern pattern = r'^[A-Za-z]{4}0[A-Z0-9a-z]{6}$';
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value ?? '')) {
      return 'Enter Valid IFSC code';
    } else {
      return null;
    }
  }
  static String? validateBankAccountNumber(String? value) {
    Pattern pattern = r'^\d{9,18}$';
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value ?? '')) {
      return 'Enter Valid Account Number';
    } else {
      return null;
    }
  }

  static String? validateRequiredField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field Cannot be blank';
    } else {
      return null;
    }
  }

  static String? validateDropDownField(var val) {
    if (val == null || val.item!.isEmpty) {
      return "Please select your response";
    }
    return null;
  }

  static String? validateDateOfBirth(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Field is Required';
    } else if(isAdult(value)){
      return null;
    }else{
      return 'Age should be Greater than 18 years';
    }
  }

  static isAdult(String birthDateString) {
    String datePattern = "yyyy-MM-dd";

    // Current time - at this moment
    DateTime today = DateTime.now();

    // Parsed date to check
    DateTime birthDate = DateFormat(datePattern).parse(birthDateString);

    // Date to check but moved 18 years ahead
    DateTime adultDate = DateTime(
      birthDate.year + 18,
      birthDate.month,
      birthDate.day,
    );

    return adultDate.isBefore(today);
  }

  static String? validateAdhar(String? value) {
    Pattern pattern = "\\d{12}";
    RegExp regex =  RegExp(pattern.toString());
    if (!regex.hasMatch(value ?? '')) {
      return 'Enter Valid Adhar number';
    } else {
      return null;
    }
  }
  static String? validatePincode(String? value) {
    Pattern pattern = "\\d{6}";
    RegExp regex =  RegExp(pattern.toString());
    if (!regex.hasMatch(value ?? '')) {
      return 'Enter Valid pin code';
    } else {
      return null;
    }
  }


  static String? validatePan(String? value) {
    Pattern pattern = r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$';
    RegExp regex =  RegExp(pattern.toString());
    if (!regex.hasMatch(value ?? '')) {
      return 'Enter Valid PAN number';
    } else {
      return null;
    }
  }

  static String? validatePRAN(String val) {
    if (val == null || val.isEmpty) {
      return "Please Enter PRAN Number";
    }
    if (val.length > 12 || val.length < 12) {
      return "Please enter valid 12 digit PRAN.";
    }
    return null;
  }

}
