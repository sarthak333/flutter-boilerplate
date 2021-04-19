import 'package:flutter_boilerplate/constants/queries.dart';
import 'package:flutter_boilerplate/core/data/models/api_response_model.dart';
import 'package:flutter_boilerplate/core/data/providers/network/network_request_handlers.dart';

// Returns dynamic type for now. Will return the dataType model of the response though.
Future<dynamic> handleUserLogin(String email, String password) async {
  ApiResponse response = await graphqlQuery(login, {
    'email': email,
    'password': password,
  });
  return response;
}

Future<dynamic> getCurrentUSer() async {
  ApiResponse response = await graphqlQuery(currentUser, {});
  return response;
}
