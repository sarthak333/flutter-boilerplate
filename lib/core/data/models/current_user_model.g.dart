// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension CurrentUserCopyWith on CurrentUser {
  CurrentUser copyWith({
    int? id,
  }) {
    return CurrentUser(
      id: id ?? this.id,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentUser _$CurrentUserFromJson(Map<String, dynamic> json) {
  return CurrentUser(
    id: json['id'] as int?,
  );
}

Map<String, dynamic> _$CurrentUserToJson(CurrentUser instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
