
import 'package:cash_counter/core/data_models/auth/registration_response.dart';

abstract class AppRepository{

  String? getAuthToken();
  void setAuthToken(String token);

  int getUserId();
  void setUserId(int userId);

  Future<RegistrationResponse> registerUser(Map userDetails);

}