import 'package:flutter/material.dart';
import 'package:mefit/admin/export.dart';
import 'package:mefit/core/core.dart';
import 'package:mefit/model/model.dart';

class LandingProvider extends MFBaseViewModel {
  UserModel? _user;
  UserModel? get user => _user;

  var controller = ScrollController();
  LandingPageType _selectedPage = LandingPageType.dashboard;
  LandingPageType get selectedPage => _selectedPage;
  void updatePageType(LandingPageType type) {
    _selectedPage = type;
    notifyListeners();
  }

  Widget get contentView {
    switch (_selectedPage) {
      case LandingPageType.dashboard:
        return LandingDashboardView(viewModel: this);
      case LandingPageType.account:
        return const LandingAccountsView();
      case LandingPageType.course:
        return const LandingCoursesView();
      case LandingPageType.support:
        return const LandingSupportView();
      case LandingPageType.terms:
        return const TermsAgreeView();
      case LandingPageType.privacy:
        return const PrivacyPolicyView();
      case LandingPageType.settings:
        return const PrivacyPolicyView();
    }
  }

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
        } else {
          Navigator.of(context).pushReplacementNamed('/login');
          return;
        }
      } catch (e) {
        setError(e);
      } finally {
        notifyListeners();
      }
    }());
  }
}

enum LandingPageType {
  dashboard,
  account,
  course,
  support,
  terms,
  privacy,
  settings,
}
