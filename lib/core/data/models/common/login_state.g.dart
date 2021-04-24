// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension LoginStateCopyWith on LoginState {
  LoginState copyWith({
    bool? isLoginInProgress,
    bool? isLoginSuccessful,
  }) {
    return LoginState(
      isLoginInProgress: isLoginInProgress ?? this.isLoginInProgress,
      isLoginSuccessful: isLoginSuccessful ?? this.isLoginSuccessful,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginState _$LoginStateFromJson(Map<String, dynamic> json) {
  return LoginState(
    isLoginInProgress: json['isLoginInProgress'] as bool,
    isLoginSuccessful: json['isLoginSuccessful'] as bool?,
  );
}

Map<String, dynamic> _$LoginStateToJson(LoginState instance) =>
    <String, dynamic>{
      'isLoginInProgress': instance.isLoginInProgress,
      'isLoginSuccessful': instance.isLoginSuccessful,
    };
