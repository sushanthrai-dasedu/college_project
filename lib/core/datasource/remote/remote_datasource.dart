import 'package:dio/dio.dart';

import '../../data_models/auth/registration_response.dart';

abstract class RemoteDatasource {


 Future<RegistrationResponse> register(Map userInfo);
}