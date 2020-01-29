import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/blocs/login/login_bloc.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/blocs/login/login_events.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/blocs/login/login_states.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/models/enums/connection_application.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/screens/components/information/information_display.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/screens/components/information/waiting_screen.dart';

/// [LoginPage] entry point for login page's widgets
/// 
class LoginPage extends StatelessWidget {

  /// [_onButtonPressed] add an event in the [LoginBloc]
  void _onButtonPressed(BuildContext context, ConnectionApplication application) {
    BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(application: application));
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (BuildContext context, LoginState state) {
        if (state is Failure) {
          throwError(context, state.error);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (BuildContext context, LoginState state) {
          if (state is Initial) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
                    child: FlutterLogo(
                      size: MediaQuery.of(context).size.height*0.3,
                    )
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        FacebookSignInButton(
                          onPressed: () {
                            if (state is! ProcessAuth && state is! ProcessLoading) {
                              _onButtonPressed(context, ConnectionApplication.FACEBOOK);
                            }
                          },
                        ),
                        GoogleSignInButton(
                          onPressed: () {
                            if (state is! ProcessAuth && state is! ProcessLoading) {
                              _onButtonPressed(context, ConnectionApplication.GOOGLE);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return WaitingScreen();
          }
        },
      ),
    );
  }
}