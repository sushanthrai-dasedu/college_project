import 'package:cash_counter/core/const/shared_pref_consts.dart';
import 'package:cash_counter/core/datasource/locale/local_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDatasourceImpl implements LocaleDatasource{


  SharedPreferences  sharedPreferences;

  LocalDatasourceImpl(this.sharedPreferences);

  @override
  String? getAuthToken() {
    return sharedPreferences.getString(SharedPrefConstants.authToken);
  }

  @override
  void setAuthToken(String accessToken) {
    sharedPreferences.setString(SharedPrefConstants.authToken, accessToken);
  }

  @override
  void clearAuthToken() {
    sharedPreferences.remove(SharedPrefConstants.authToken);
  }


  @override
  int getUserId() {
    return sharedPreferences.getInt(SharedPrefConstants.authToken) ?? 0;
  }

  @override
  void setUserId(int userId) {
    sharedPreferences.setInt(SharedPrefConstants.authToken, userId);
  }


}