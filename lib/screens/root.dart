import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/blocs/application/root_bloc.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/blocs/application/root_states.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/configuration/theme/custom_font_style.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/models/classes/modal_tile.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/screens/components/information/waiting_screen.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/screens/home/home.dart';

/// [Root] is the root page of Liyo app
///
class Root extends StatefulWidget {
  const Root({Key key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {

  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  /// [_buildPage] builds the page according to the index it gets as entry
  ///
  /// @param int index : the index of the page to display
  ///
  /// @return Widget : the widget to display
  ///
  Widget _buildPage(int index) {
    Widget widgetToBuild;
    switch (index) {
      case 0:
        widgetToBuild = Home();
        break;
      case 1:
        widgetToBuild = Home();
        break;
      case 2:
        widgetToBuild = Home();
        break;
      default:
        widgetToBuild = WaitingScreen();
    }
    return widgetToBuild;
  }

  /// [_showNoWifiInformation] returns a snackbar that indicates that there is no wifi connection
  ///
  /// @param BuildContext : the current context
  ///
  void _showNoWifiInformation(BuildContext context) {
    Flushbar<Object>(
      title: 'No internet connection',
      message: 'The application is unable to work offline...',
      icon: Icon(
        Icons.signal_wifi_off,
        size: 28,
        color: Theme.of(context).accentColor,
      ),
      duration: const Duration(seconds: 3),
      flushbarStyle: FlushbarStyle.FLOATING,
      margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.005),
      borderRadius: MediaQuery.of(context).size.height * 0.005,
    )..show(context);
  }

  /// [_showModalBottomSheet] displays a modal bottom sheet
  ///
  /// @param BuildContext : the current context
  /// @param List<ModalTile> tiles : the list of tiles to display
  ///
  void _showModalBottomSheet(BuildContext context, List<ModalTile> tiles) {
    showModalBottomSheet<Widget>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          child: ListView.builder(
            itemCount: tiles.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(tiles[index].icon,
                      color: Theme.of(context).textSelectionColor,
                    ),
                    title: Text(
                      tiles[index].title,
                      style: CustomFontStyle.commonTextStyle.copyWith(
                        color: Theme.of(context).textSelectionColor,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,
                      color: Theme.of(context).textSelectionColor,
                    ),
                    onTap: tiles[index].onTap,
                  ),
                  const Divider(),
                ],
              );
            },
          ),
        );
      },
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 3.0,
    );
  }

  /// [_showAlertDialog] displays an alert dialog
  ///
  /// @param BuildContext : the current context
  /// @param String title : the title to display
  /// @param String content : the content to display
  /// @param List<Widget> actions : the content to display after the title and the content
  ///
  void _showAlertDialog(BuildContext context, String title, String content, List<Widget> actions) {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text(title,
            style: CustomFontStyle.secondTitleTextStyle.copyWith(
              color: Theme.of(context).textSelectionColor,
            ),
          ),
          content: Text(content,
            style: CustomFontStyle.subtitleTextStyle.copyWith(
              color: Theme.of(context).textSelectionColor,
            ),
          ),
          actions: actions,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          elevation: 3.0,
        );
      },
    );
  }

  /// [_showInformationDialog] displays a simple dialog with some informations
  /// 
  /// @param BuildContext : the current context
  /// @param String title : the title to display
  /// @param List<Widget> widgets : the content to display after the title
  /// 
  void _showInformationDialog(BuildContext context, String title, List<Widget> widgets) {
    showDialog<SimpleDialog>(
      context: context,
      builder: (BuildContext ctx) {
        return SimpleDialog(
          title: Text(title,
            style: CustomFontStyle.secondTitleTextStyle.copyWith(
              color: Theme.of(context).textSelectionColor,
            ),
          ),
          children: widgets,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          elevation: 3.0,
        );
      }
    );
  }

  /// [_showSnackBar] displays a snackbar at the bottom of the application in order to inform the user
  /// 
  /// @param BuildContext context
  /// @param String title
  /// @param String message
  /// @param IconData icon
  /// 
  void _showSnackBar(BuildContext context, String title, String message, IconData icon) {
    Flushbar<Object>(
      title: title,
      message: message,
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      icon: Icon(icon,
        size: 28,
        color: Theme.of(context).accentColor,
      ),
      duration: const Duration(seconds: 3),
      flushbarStyle: FlushbarStyle.FLOATING,
      margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.005),
      borderRadius: MediaQuery.of(context).size.height * 0.005,
    )..show(context);
  }

  @override
  Widget build(BuildContext context) {
    final Color _bottomButtonColor = Theme.of(context).buttonColor;

    return BlocListener<RootBloc, RootState>(
      listener: (BuildContext context, RootState state) {
        if (state is ShowNoWifiInformation) {
          _showNoWifiInformation(context);
        } else if (state is ShowModalBottomSheet) {
          _showModalBottomSheet(context, state.tiles);
        } else if (state is ShowAlertDialog) {
          _showAlertDialog(context, state.title, state.content, state.actions);
        } else if (state is ShowInformationDialog) {
          _showInformationDialog(context, state.title, state.widgets);
        } else if (state is ShowSnackBar) {
          _showSnackBar(context, state.title, state.message, state.icon);
        }
      },
      child: Scaffold(
        body: _buildPage(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 5.0,
          selectedFontSize: 12.0,
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: _bottomButtonColor.withOpacity(0.5)),
              activeIcon: Icon(Icons.home, color: _bottomButtonColor),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group, color: _bottomButtonColor.withOpacity(0.5)),
              activeIcon: Icon(Icons.group, color: _bottomButtonColor),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications, color: _bottomButtonColor.withOpacity(0.5)),
              activeIcon: Icon(Icons.notifications, color: _bottomButtonColor),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message, color: _bottomButtonColor.withOpacity(0.5)),
              activeIcon: Icon(Icons.message, color: _bottomButtonColor),
            )
          ],
        ),
      ),
    );
  }
}