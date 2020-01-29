import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/models/enums/connection_application.dart';

/// [LoginEvent] describes the different events that happens during the login
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => <Object>[];
}

/// Event : A button is pressed to login
class LoginButtonPressed extends LoginEvent {
  const LoginButtonPressed({
    @required this.application,
  }) : assert(application != null);

  final ConnectionApplication application;

  @override
  List<Object> get props => <Object>[application];

  @override
  String toString() => 'LoginButtonPressed { application: $application }';
}

/// Event : The webview is closed after auth
class LoginWebviewClosed extends LoginEvent {
  const LoginWebviewClosed({this.callbackURL});

  final String callbackURL;

  @override
  List<Object> get props => <Object>[callbackURL];

  @override
  String toString() => 'LoginWebviewClosed { callbackURL: $callbackURL }';
}

/// Event : The webview is closed without auth
class LoginWebviewBack extends LoginEvent {}