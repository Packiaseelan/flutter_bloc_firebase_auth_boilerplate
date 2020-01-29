import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/blocs/application/application_events.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/blocs/application/application_states.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/providers/repositories/user_repository.dart';

/// [ApplicationBloc] links [ApplicationEvent] to [ApplicationState]
///
class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final UserRepository userRepository = UserRepository();

  @override
  ApplicationState get initialState => ApplicationUninitialized();

  @override
  Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
    if (event is AppStarted) {
      yield UserUnauthenticated();
      
    }

    if (event is LoggedIn) {
      
    }

    if (event is LoggedOut) {
      yield UserUnauthenticated();
    }
  }
}