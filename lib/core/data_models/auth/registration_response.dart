import 'package:cash_counter/core/data_models/auth/user_details.dart';

class RegistrationResponse {
  bool? success;
  String? message;
  Data? data;


  RegistrationResponse({this.success, this.message,this.data});

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) => RegistrationResponse(
      success : json['success'],
      message : json['message'],
      data:  (json['data'] != null) ? (
          Data.fromJson(json['data'])
      ) :  null
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['success'] = success;
    data['msg'] = message;
    data['data']= (this.data == null)? null : this.data!.toJson();
    return data;
  }

  RegistrationResponse.withError(String errorMessage) : message = errorMessage;

}

class Data {
  final String token;
  final UserDetails userDetails;

  Data({
    required this.token,
    required this.userDetails
  });

  @override
  factory Data.fromJson(Map<String, dynamic> json) => Data(
      token: json["token"],
      userDetails : UserDetails.fromJson(json['user_details'])
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user_details": userDetails.toJson()
  };

}