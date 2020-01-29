import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/models/enums/connection_application.dart';

/// [LoginState] represents the different states of the login with an application
abstract class LoginState extends Equatable {
  @override
  List<Object> get props => <Object>[];
}

/// State : No process started
class Initial extends LoginState {}

/// State : The login process has started
class ProcessStart extends LoginState {}

/// State : The user is auhenticating
class ProcessAuth extends LoginState {
  ProcessAuth({@required this.url, @required this.application});

  final String url;
  final ConnectionApplication application;

  @override
  List<Object> get props => <Object>[url, application];

  @override
  String toString() => 'ProcessAuth { url: $url, application: $application }';
}

/// State : The api is called to log in
class ProcessLoading extends LoginState {}

/// State : An error has been thrown during loading
class Failure extends LoginState {
  Failure({@required this.error});

  final String error;

  @override
  List<Object> get props => <Object>[error];

  @override
  String toString() => 'Failure { error: $error }';
}