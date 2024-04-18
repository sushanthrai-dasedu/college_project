

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ui/auth/cubit/registration_cubit.dart';
import '../const/constants.dart';
import '../datasource/locale/local_datasource.dart';
import '../datasource/locale/locle_datesource_implementation.dart';
import '../datasource/remote/remote_datasource.dart';
import '../datasource/remote/remote_datasource_implementation.dart';
import '../http_client/dio_client.dart';
import '../repository/repository.dart';
import '../repository/repository_implementation.dart';


GetIt serviceLocator = GetIt.instance;

Future<void> setUpServiceLocator() async {
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  serviceLocator.registerSingleton<SharedPreferences>(sharedPreferences);

  serviceLocator.registerLazySingleton<DioClient>(() => DioClient(baseUrl: Constants.baseUrl, dio: Dio(), interceptors: [Interceptor()]));

  serviceLocator.registerLazySingleton<RemoteDatasource>(() =>  RemoteDatasourceImpl(dioInstance: serviceLocator<DioClient>()));

  serviceLocator.registerLazySingleton<LocaleDatasource>(() =>  LocalDatasourceImpl(serviceLocator<SharedPreferences>()));

  serviceLocator.registerLazySingleton<AppRepository>(() => RepositoryImpl(remoteDatasource: serviceLocator<RemoteDatasource>(), localDateSource: serviceLocator<LocaleDatasource>()));

  serviceLocator.registerLazySingleton<RegistrationCubit>(() => RegistrationCubit(serviceLocator<AppRepository>()));

}
