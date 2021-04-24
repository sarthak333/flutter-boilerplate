// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension AppStateCopyWith on AppState {
  AppState copyWith({
    CurrentUser? currentUser,
    bool? isUserLoggedIn,
    String? token,
  }) {
    return AppState(
      currentUser: currentUser ?? this.currentUser,
      isUserLoggedIn: isUserLoggedIn ?? this.isUserLoggedIn,
      token: token ?? this.token,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return AppState(
    token: json['token'] as String?,
    isUserLoggedIn: json['isUserLoggedIn'] as bool,
    currentUser: json['currentUser'] == null
        ? null
        : CurrentUser.fromJson(json['currentUser'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AppStateToJson(AppState instance) => <String, dynamic>{
      'token': instance.token,
      'isUserLoggedIn': instance.isUserLoggedIn,
      'currentUser': instance.currentUser,
    };
