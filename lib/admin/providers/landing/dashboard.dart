import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mefit/admin/export.dart';
import 'package:mefit/core/core.dart';
import 'package:mefit/model/model.dart';

class LandingDashboardProvider extends MFBaseViewModel {
  @override
  void init(BuildContext context) {
    super.init(context);
    fetchData();
  }

  List<LandingCardModel> _cardModels = [];
  List<LandingCardModel> get cardModels => _cardModels;

  final List<UserModel> _recentUsers = [];
  List<UserModel> get recentUsers => _recentUsers;

  @override
  Future<void> fetchData() async {
    _cardModels = kDashCardTemp;

    runBusyFuture(() async {
      try {
        _recentUsers.clear();
        var respUsers = await MFAdminAPI.getRecentUsers();
        if (respUsers.isSuccessful) {
          _recentUsers.addAll((respUsers.data as List)
              .map((json) => UserModel.fromJson(json))
              .toList());
          Logger().d(_recentUsers.length);
        }
      } catch (e) {
        Logger().e(e);
        setError(e);
      } finally {
        notifyListeners();
      }
    }());

    notifyListeners();
  }
}
