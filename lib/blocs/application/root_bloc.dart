import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/blocs/application/root_events.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/blocs/application/root_states.dart';

/// [RootBloc] links [RootEvent] to [RootState]
///
class RootBloc extends Bloc<RootEvent, RootState> {
  @override
  RootState get initialState => RootStable();

  @override
  Stream<RootState> mapEventToState(RootEvent event) async* {
    if (event is DisplayModalBottomSheet) {
      yield ShowModalBottomSheet(tiles: event.tiles);
      yield RootStable();
    }

    if (event is DisplayNoWifiInformation) {
      yield ShowNoWifiInformation();
      yield RootStable();
    }

    if (event is DisplayAlertDialog) {
      yield ShowAlertDialog(title: event.title, content: event.content, actions: event.actions);
      yield RootStable();
    }

    if (event is DisplayInformationDialog) {
      yield ShowInformationDialog(title: event.title, widgets: event.widgets);
      yield RootStable();
    }

    if (event is DisplaySnackBar) {
      yield ShowSnackBar(title: event.title, message: event.message, icon: event.icon);
      yield RootStable();
    }
  }
}