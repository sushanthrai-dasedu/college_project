import 'package:bloc/bloc.dart';
import 'package:cash_counter/core/data_models/auth/registration_response.dart';
import 'package:cash_counter/core/di/service_locator.dart';
import 'package:cash_counter/core/repository/repository.dart';
import 'package:cash_counter/localization/language/languages.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit(this.repository) : super(RegistrationInitial());

  final AppRepository repository;

  Future<void> registerDevice(Map userData) async {
    emit(RegistrationInProgress());
    try {
      final RegistrationResponse response =
          await repository.registerUser(userData);
      if (response.data != null) {
        //If we need to save user token to shared preference, we can do that like bellow
        repository.setAuthToken(response.data!.token);

        emit(RegistrationSuccessful(response));
      } else {
        emit(RegistrationFailed(response.message ?? "Something went wrong"));
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(RegistrationFailed("Something went wrong!"));
    }
  }
}
