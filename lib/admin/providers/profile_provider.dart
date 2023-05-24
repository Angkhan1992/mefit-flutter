import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mefit/admin/export.dart';
import 'package:mefit/core/core.dart';
import 'package:mefit/model/model.dart';

class ProfileProvider extends MFBaseViewModel {
  UserModel? _user;
  UserModel? get user => _user;

  @override
  void init(BuildContext context) {
    super.init(context);
    fetchData();
  }

  @override
  Future<void> fetchData() async {
    runBusyFuture(() async {
      try {
        var resp = await MFAdminAPI.getTokenUser();
        if (resp.isSuccessful) {
          _user = UserModel.fromJson(resp.data);
        }
      } catch (e) {
        Logger().e(e);
      } finally {
        notifyListeners();
      }
    }());
  }
}
