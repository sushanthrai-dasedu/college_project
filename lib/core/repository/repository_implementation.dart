



import 'package:leave_tracker/core/repository/repository.dart';

import '../data_models/auth/registration_response.dart';
import '../datasource/locale/local_datasource.dart';
import '../datasource/remote/remote_datasource.dart';

class RepositoryImpl implements AppRepository{
  RemoteDatasource remoteDatasource;
  LocaleDatasource localDateSource;

  RepositoryImpl({required this.remoteDatasource, required this.localDateSource});

  @override
  String? getAuthToken() {
    return localDateSource.getAuthToken();
  }

  @override
  int getUserId() {
    return localDateSource.getUserId();
  }

  @override
  Future<RegistrationResponse> registerUser(Map userDetails) async{
    return await remoteDatasource.register(userDetails);
  }

  @override
  void setAuthToken(String token) {
    localDateSource.setAuthToken(token);
  }

  @override
  void setUserId(int userId) {
    localDateSource.setUserId(userId);
  }



}