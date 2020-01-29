import 'package:flutter/material.dart';

/// Object with parameters used to display a modal bottom sheet
///
///
/// @param bool display : whether we should trigger the display or not
/// @param List<ModalTile> tiles : the tiles to display on the modal bottom sheet
///
class ModalBottomSheet {

  ModalBottomSheet({
    this.display,
    this.tiles,
  });

  bool display;
  List<ModalTile> tiles;
}

/// Class that describes a tile for the bottomsheet modal
///
///
/// @param void Function() onTap : the function to trigger when we tap on it
/// @param String title : the title to display
/// @param IconData icon : the icon to display
///
class ModalTile {

  ModalTile({
    this.onTap,
    this.title,
    this.icon,
  });

  void Function() onTap;
  String title;
  IconData icon;
}