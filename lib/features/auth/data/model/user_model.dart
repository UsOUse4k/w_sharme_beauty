import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? name;
  String? id;

  UserModel(this.id, this.name);
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
