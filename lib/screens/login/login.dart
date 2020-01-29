import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/blocs/application/application_bloc.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/blocs/login/login_bloc.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/screens/login/components/login_page.dart';

/// [Login] entry point for login page's bloc
class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        create: (BuildContext context) => LoginBloc(applicationBloc: BlocProvider.of<ApplicationBloc>(context)),
        child: LoginPage(),
      ),
    );
  }
}