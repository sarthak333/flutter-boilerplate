import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_state.g.dart';

@JsonSerializable()
@CopyWith()
class LoginState {
  bool isLoginInProgress;
  bool? isLoginSuccessful;

  LoginState({this.isLoginInProgress = false, this.isLoginSuccessful});

  factory LoginState.fromJson(Map<String, dynamic> json) =>
      _$LoginStateFromJson(json);
  Map<String, dynamic> toJson() => _$LoginStateToJson(this);
}
