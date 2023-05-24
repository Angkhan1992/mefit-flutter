// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mefit/services/services.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory UserModel({
    String? id,
    String? firstName,
    String? lastName,
    String? onMember,
    String? expiredDate,
    String? desc,
    String? token,
    String? role,
    String? email,
    String? password,
    int? v,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(kConvertModel(json));
}
