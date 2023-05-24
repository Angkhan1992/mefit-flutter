import 'package:flutter/material.dart';
import 'package:mefit/core/core.dart';
import 'package:mefit/model/model.dart';

class LandingProvider extends MFBaseViewModel {
  UserModel? _user;

  @override
  void init(BuildContext context) {
    super.init(context);
    fetchData();
  }

  @override
  Future<void> fetchData() async {}
}
