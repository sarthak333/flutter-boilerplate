import 'package:flutter_boilerplate/config/utils/app.dart';
import 'package:flutter_boilerplate/constants/queries.dart';
import 'package:flutter_boilerplate/core/data/models/api_response_model.dart';
import 'package:flutter_boilerplate/core/data/models/current_user_model.dart';
import 'package:flutter_boilerplate/core/data/repositories/network_request_handlers.dart';

class GlobalRepo {
  Future<CurrentUser?> getCurrentUser() async {
    ApiResponse response = await graphqlQuery(currentUser);
    CurrentUser user;
    if (response.isSuccess) {
      user = CurrentUser.fromJson(response.data['currentUser']);
      return user;
    } else {
      App.notifyError('Error fetching your details!');
    }
  }
}
