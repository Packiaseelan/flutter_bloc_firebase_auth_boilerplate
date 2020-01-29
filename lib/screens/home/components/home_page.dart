import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/blocs/home/home_bloc.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/blocs/home/home_states.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/screens/components/information/information_display.dart';

/// [HomePage] entry point for home page's widgets
/// 
class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (BuildContext context, HomeState state) {
        if (state is Failure) {
          throwError(context, state.error);
        }
      },
    );
  }
}