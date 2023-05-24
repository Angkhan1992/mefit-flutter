import 'package:mefit/model/model.dart';

extension UserModelExt on UserModel {
  String get shortName {
    return '$lastName ${firstName?[0]}';
  }
}
