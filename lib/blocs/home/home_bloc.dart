import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/blocs/home/home_events.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/blocs/home/home_states.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/providers/repositories/user_repository.dart';

/// [HomeBloc] links [HomeEvents] to [HomeStates]
/// 
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc();

  final UserRepository userRepository = UserRepository();

  @override
  HomeState get initialState => InitialState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    
  }
}