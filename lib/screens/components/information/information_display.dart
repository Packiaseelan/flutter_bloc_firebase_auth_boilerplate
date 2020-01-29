import 'package:flutter/material.dart';

/// Throws the error and displays a snackbar with the error
/// 
/// @param BuildContext : the current context
/// @param String error : the error to display
/// 
void throwError(BuildContext context, String error) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text(error),
      backgroundColor: Theme.of(context).errorColor,
    ),
  );
}