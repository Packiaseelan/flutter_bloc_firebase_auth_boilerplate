import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/models/classes/modal_tile.dart';

/// [RootState] describes the different states of the root
abstract class RootState extends Equatable {
  @override
  List<Object> get props => <Object>[];
}

/// State : Stable state
class RootStable extends RootState {}

/// State : Displays the modal bottom sheet
class ShowModalBottomSheet extends RootState {
  ShowModalBottomSheet({@required this.tiles}) : assert(tiles != null);

  final List<ModalTile> tiles;

  @override
  List<Object> get props => <Object>[tiles];

  @override
  String toString() => 'RootShowModalBottomSheet { tiles: $tiles }';
}

/// State : Displays the no wifi information snackbar
class ShowNoWifiInformation extends RootState {}

/// State : Displays the alert dialog
class ShowAlertDialog extends RootState {
  ShowAlertDialog({
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
  String toString() => 'ShowAlertDialog { title: $title, content: $content, actions: ${actions.toList().toString()} }';
}

/// State : Displays a simple dialog with informations
class ShowInformationDialog extends RootState {

  ShowInformationDialog({
    this.title,
    this.widgets,
  });

  final String title;
  final List<Widget> widgets;

  @override
  List<Object> get props => <Object>[title, widgets];

  @override
  String toString() => 'RootShowInformationDialog { title: $title, widgets: ${widgets.toList().toString()} }';
}

/// State : Displays a simple snackbar with informations
class ShowSnackBar extends RootState {

  ShowSnackBar({
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
  String toString() => 'RootShowSnackBar { title: $title, message: $message, icon: $icon }';
}