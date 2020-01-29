import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/blocs/home/home_bloc.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/screens/home/components/home_page.dart';

/// [Home] entry point for home page's bloc
///
class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (BuildContext context) => HomeBloc(),
      child: HomePage(),
    );
  }
}