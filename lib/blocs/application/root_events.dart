import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/models/classes/modal_tile.dart';

/// [RootEvent] describes the different events that can happen on the app
abstract class RootEvent extends Equatable {
  const RootEvent();

  @override
  List<Object> get props => <Object>[];
}

/// Event : display the modal bottom sheet
class DisplayModalBottomSheet extends RootEvent {
  const DisplayModalBottomSheet({@required this.tiles}) : assert(tiles != null);

  final List<ModalTile> tiles;

  @override
  List<Object> get props => <Object>[tiles];

  @override
  String toString() => 'DisplayModalBottomSheet { tiles: ${tiles.toString()} }';
}

/// Event : display the no wifi snackbar
class DisplayNoWifiInformation extends RootEvent {}

/// Event : display an alert dialog
class DisplayAlertDialog extends RootEvent {
  const DisplayAlertDialog({
    this.title,
    this.content,
    this.actions,
  });

  final String title;
  final String content;
  final List<Widget> actions;

  @override
  List<Object> get props => <Object>[title, content, actions];

  @override
  String toString() => 'DisplayAlertDialog { title: $title, content: $content, actions: $actions }';
}

/// Event : display a simple informative dialog
class DisplayInformationDialog extends RootEvent {
  
  const DisplayInformationDialog({
    this.title,
    this.widgets,
  });

  final String title;
  final List<Widget> widgets;

  @override
  List<Object> get props => <Object>[title, widgets];

  @override
  String toString() => 'DisplayInformationDialog { title: $title, widgets: ${widgets.toList().toString()} }';
}

/// Event : display a snackbar
class DisplaySnackBar extends RootEvent {

  const DisplaySnackBar({
    this.title,
    this.message,
    this.icon,
  });

  final String title;
  final String message;
  final IconData icon;

  @override
  List<Object> get props => <Object>[title, message, icon];

  @override
  String toString() => 'DisplaySnackBar { title: $title, message: $message, icon: $icon }';
}