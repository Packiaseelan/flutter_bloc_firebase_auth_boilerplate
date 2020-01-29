import 'package:flutter/material.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/screens/components/information/waiting_widget.dart';

/// [WaitingScreen] displayed when waiting
/// 
class WaitingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WaitingWidget(),
    );
  }
}