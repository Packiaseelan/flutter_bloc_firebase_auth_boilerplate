import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/blocs/application/application_bloc.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/blocs/application/application_events.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/blocs/login/login_events.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/blocs/login/login_states.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/models/enums/connection_application.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/providers/repositories/user_repository.dart';

/// [LoginBloc] links [LoginEvent] to [LoginState]
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({@required this.applicationBloc}) : assert(applicationBloc != null);

  final UserRepository userRepository = UserRepository();
  final ApplicationBloc applicationBloc;

  @override
  LoginState get initialState => Initial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      if (event.application == ConnectionApplication.FACEBOOK) {
        final FacebookLogin facebookLogin = FacebookLogin();
        facebookLogin.logOut();
        final FacebookLoginResult result = await facebookLogin.logIn(<String>[]);
        print(result.status.toString());
        switch (result.status) {
          case FacebookLoginStatus.loggedIn:
            try {
              //await userRepository.logIn(result.accessToken.token, ConnectionApplication.FACEBOOK);
              applicationBloc.add(LoggedIn());
              yield Initial();
            } catch (e) {
              yield Initial();
              break;
            }
            break;
          case FacebookLoginStatus.cancelledByUser:
            yield Initial();
            break;
          case FacebookLoginStatus.error:
            yield Failure(error: 'Oops something went wrong, retry later.');
            add(LoginWebviewBack());
            break;
        }
      }
    }

    if (event is LoginWebviewBack || event is LoginWebviewClosed) {
      yield Initial();
    }
  }
}