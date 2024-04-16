import 'package:cash_counter/core/const/constants.dart';
import 'package:cash_counter/core/data_models/auth/registration_response.dart';
import 'package:cash_counter/core/datasource/remote/remote_datasource.dart';
import 'package:dio/dio.dart';

import '../../../localization/language/languages.dart';
import '../../di/service_locator.dart';
import '../../http_client/dio_client.dart';




class RemoteDatasourceImpl implements RemoteDatasource{
  DioClient dioInstance;

  RemoteDatasourceImpl({required this.dioInstance});

  @override
  Future<RegistrationResponse> register(Map userInfo) async {
    try {
      final response = await dioInstance.dioInstance!
          .post("${dioInstance.baseUrl}${Constants.register}", data: userInfo);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return RegistrationResponse.fromJson(response.data);
      } else {
        return RegistrationResponse.withError(dioInstance.handleStatusCodeError(response.statusCode));
      }
    } catch (error) {
      return RegistrationResponse.withError(error is DioException ? dioInstance.handleError(error) : "Something went wrong!");
    }
  }


}