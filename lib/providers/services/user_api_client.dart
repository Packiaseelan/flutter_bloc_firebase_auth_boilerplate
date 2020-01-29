import 'package:http/http.dart' as http;

/// [UserApiClient] is the part of the application that is going to contact the API Gateway
/// in order to get informations about the user
///
/// @param http.Client : to make http operations
///
class UserApiClient {
  factory UserApiClient() => _singleton;

  UserApiClient._internal();

  static final UserApiClient _singleton = UserApiClient._internal();

  final http.Client _httpClient = http.Client();


}