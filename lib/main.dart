import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/blocs/application/application_bloc.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/blocs/application/application_events.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/blocs/application/application_states.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/blocs/application/root_bloc.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/configuration/theme/theme_notifier.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/providers/shared_pref_calls.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/screens/components/information/splash_screen.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/screens/components/information/waiting_screen.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/screens/components/restart_widget.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/screens/login/login.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/screens/root.dart';
import 'package:provider/provider.dart';

/// [SimpleBlocDelegate] is used to have a trave of the different events happening in the application
///
class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc<dynamic, dynamic> bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

/// Main method of the application
///
void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  WidgetsFlutterBinding.ensureInitialized();
  
  SharedPrefCalls().isDarkMode().then((bool onValue) {
    runApp(
      MultiBlocProvider(
        providers: <BlocProvider<Bloc<dynamic, dynamic>>>[
          BlocProvider<ApplicationBloc>(
            create: (BuildContext context) => ApplicationBloc()..add(AppStarted()),
          ),
          BlocProvider<RootBloc>(
            create: (BuildContext context) => RootBloc(),
          ),
        ],
        child: RestartWidget(
          child: ChangeNotifierProvider<ThemeNotifier>(
            create: (_) => ThemeNotifier(onValue ? buildDarkTheme() : buildLightTheme()),
            child: const App(),
          ),
        ),
      ),
    );

    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  });
}

/// Application build
///
class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Timer timer;

  @override
  Widget build(BuildContext context) {
    final ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'orato',
      home: BlocBuilder<ApplicationBloc, ApplicationState>(
        builder: (BuildContext context, ApplicationState state) {
          if (state is UserAuthenticated) {
            return const Root();
          } else if (state is UserUnauthenticated) {
            return Login();
          } else if (state is Loading) {
            return WaitingScreen();
          }
          return SplashScreen();
        },
      ),
      theme: themeNotifier.getTheme(),
    );
  }
}