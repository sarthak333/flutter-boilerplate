import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'current_user_model.g.dart';

@JsonSerializable()
@CopyWith()
class CurrentUser {
  int? id;

  CurrentUser({
    this.id,
  });

  factory CurrentUser.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentUserToJson(this);
}
