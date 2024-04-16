class UserDetails{
  final bool isAccountActive;
  final int userId;
  final String userName;
  final String userEmail;
  final String mobNumber;
  final String streetAddress;
  final String state;
  final String district;
  final int pin;
  final String labName;


  UserDetails({
    required this.isAccountActive,
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.mobNumber,
    required this.streetAddress,
    required this.state,
    required this.district,
    required this.pin,
    required this.labName
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
    isAccountActive: json['isAccountActive'],
    userId: json['user_id'],
    userName: json['user_name'],
    userEmail: json['user_email'],
    mobNumber: json['mob_number'],
    streetAddress: json['street_address'],
    state: json['state'],
    district: json['district'],
    pin: json['pin'],
    labName: json['lab_name'],
  );


  Map<String, dynamic> toJson() => {
    "isAccountActive": isAccountActive,
    "user_id": userId,
    "user_name": userName,
    "user_email": userEmail,
    "mob_number": mobNumber,
    "street_address": streetAddress,
    "state": state,
    "district": district,
    "pin": pin,
    "lab_name": labName
  };
}