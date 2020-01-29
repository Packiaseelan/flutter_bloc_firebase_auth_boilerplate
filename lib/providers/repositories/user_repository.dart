import 'package:flutter_bloc_firebase_auth_boilerplate/models/classes/user.dart';
import 'package:flutter_bloc_firebase_auth_boilerplate/providers/services/user_api_client.dart';

/// [UserRepository] is the user manager
///
/// @param [UserApiClient] : to have interactions with the API
///
class UserRepository {
  factory UserRepository() => _singleton;

  UserRepository._internal();

  static final UserRepository _singleton = UserRepository._internal();

  final UserApiClient _userApiClient = UserApiClient();
  User _userState;

  User get userCurrentState => _userState;

  @override
  String toString() {
    return 'UserRepository { userState: ${_userState.toString()}}';
  }
}