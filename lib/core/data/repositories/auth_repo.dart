import 'package:flutter_boilerplate/constants/queries.dart';
import 'package:flutter_boilerplate/core/data/models/api_response_model.dart';
import 'package:flutter_boilerplate/core/data/repositories/network_request_handlers.dart';

class AuthRepo {
  Future<dynamic> handleUserLogin(String email, String password) async {
    ApiResponse response = await graphqlQuery(login, {
      'email': email,
      'password': password,
    });
    return response;
  }
}
