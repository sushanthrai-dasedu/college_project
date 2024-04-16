import 'package:cash_counter/core/di/service_locator.dart';
import 'package:cash_counter/core/repository/repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AppInterceptors extends Interceptor{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print("---API REQUEST CREATED---");
    }

    String? token = serviceLocator<AppRepository>().getAuthToken();
    if (token != null) {
      options.headers["Authorization"] = 'Bearer $token';
      debugPrint("Authorization-Token : $token");
    }


    ///use this to set conditional auth token
    // if(options.headers.containsKey("requireAuthToken")) {
    //   if(options.headers["requireAuthToken"]) {
    //
    //   }
    // }

    ///  If any api required some specific token for that particular api we can handle this like bellow
    /// set the one variable in header to determine whether to set other specific token to api or not , then perform action based on the value

    /*
      if (options.headers.containsKey("requireAnyOtherToken")) {
        String? otherToken = serviceLocator<P2pDataSource>().getOtherRequiredTokenHere();
        options.headers.remove("requireAnyOtherToken");
        options.headers.addAll({"otherToken": otherToken});
      }
     */
    return handler.next(options);

  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response != null && err.response?.statusCode != null) {
      if (err.response!.statusCode == 403 || err.response!.statusCode == 401) { // authorization errors
        //perform logout if required  / any other suitable action
      }

      if (err.response!.statusCode! > 499 ||
          err.response!.statusCode == 403 ||
          err.response!.statusCode == 400) {

        //report to firebase / or perform any other action

        // FirebaseCrashlytics.instance.recordError(err, err.stackTrace,
        //     reason:
        //     'API Error in => ${err.requestOptions.path} - ${err.response!.statusCode}',
        //     fatal: true);

      }
    } else {
      //report to firebase / or perform any other action

      // FirebaseCrashlytics.instance.recordError(err, err.stackTrace,
      //     reason: 'API Error in => ${err.requestOptions.path}', fatal: true);
    }

    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print("--RESPONSE RECEIVED FROM API---");
    }
    // if we want to perform caching we can add the response to the cache here..
    // return previous response from cache on api error / if device went offline

    return handler.next(response);
  }

}