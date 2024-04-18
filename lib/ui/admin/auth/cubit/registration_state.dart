part of 'registration_cubit.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();
}

class RegistrationInitial extends RegistrationState {
  @override
  List<Object> get props => [];
}

class RegistrationInProgress extends RegistrationState {
  @override
  List<Object> get props => [];
}

class RegistrationSuccessful extends RegistrationState {
  final RegistrationResponse response;
  const RegistrationSuccessful(this.response);
  @override
  List<Object> get props => [response];
}

class RegistrationFailed extends RegistrationState {
  final String message;
  const RegistrationFailed(this.message);
  @override
  List<Object> get props => [message];
}
