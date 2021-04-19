import 'package:flutter_boilerplate/core/data/models/common/current_user_model.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_state_model.g.dart';

@JsonSerializable()
@CopyWith()
class AppState {
  String? token;
  bool isUserLoggedIn;
  CurrentUser? currentUser;

  AppState({
    this.token,
    this.isUserLoggedIn = false,
    this.currentUser,
  });

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);
  Map<String, dynamic> toJson() => _$AppStateToJson(this);
}
