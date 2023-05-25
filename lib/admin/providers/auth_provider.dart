import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mefit/admin/export.dart';
import 'package:mefit/core/core.dart';
import 'package:mefit/services/services.dart';

class AuthProvider extends MFBaseViewModel {
  @override
  void init(BuildContext context) {
    super.init(context);
    fetchData();
  }

  @override
  Future<void> fetchData() async {}

  bool _isLogin = true;
  bool get isLogin => _isLogin;
  void changePage(bool flag) {
    _isLogin = flag;

    loginEmail = '';
    loginPassword = '';

    registerFirstName = '';
    registerLastName = '';
    registerEmail = '';
    registerNPassword = '';
    registerCPassword = '';

    notifyListeners();
  }

  bool _loadingLogin = false;
  bool get loadingLogin => _loadingLogin;

  Widget get content {
    return CustomScrollView(
      slivers: [
        WebSliverAppBar(
          context,
          onAuthTap: changePage,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Center(
              child: Container(
                margin: const EdgeInsets.all(40.0),
                padding: const EdgeInsets.all(40.0),
                decoration: BoxDecoration(
                  color: MTAdminTheme.instance?.onPrimay.withOpacity(0.75),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: _isLogin ? LoginView(vm: this) : RegisterView(vm: this),
              ),
            ),
          ]),
        ),
      ],
    );
  }

  bool _isPassword = true;
  bool get isPassword => _isPassword;
  void updatePassword() {
    _isPassword = !_isPassword;
    notifyListeners();
  }

  String loginEmail = '';
  String loginPassword = '';

  Future<void> onLogin() async {
    if (loginEmail.isEmpty || loginPassword.isEmpty) {
      setError(S.current.failed_email_password);
      return;
    }
    clearErrors();

    _loadingLogin = true;
    notifyListeners();

    await runBusyFuture(() async {
      try {
        var resp = await MFAdminAPI.loginAdmin({
          'email': loginEmail,
          'password': loginPassword,
        });
        if (resp.isSuccessful && resp.code == 200) {
          await PrefService.instance.setToken(resp.data);
        } else {
          setError(resp.code == 201 ? resp.data : resp.message);
        }
      } catch (e) {
        Logger().e(e);
        setError(e);
      } finally {
        notifyListeners();
      }
    }());

    _loadingLogin = false;
    notifyListeners();
  }

  bool _isSetPassword = true;
  bool get isSetPassword => _isSetPassword;
  void updateSetPassword() {
    _isSetPassword = !_isSetPassword;
    notifyListeners();
  }

  bool _isConPassword = true;
  bool get isConPassword => _isConPassword;
  void updateConPassword() {
    _isConPassword = !_isConPassword;
    notifyListeners();
  }

  String registerFirstName = '';
  String registerLastName = '';
  String registerEmail = '';
  String registerNPassword = '';
  String registerCPassword = '';

  bool _loadingRegister = false;
  bool get loadingRegister => _loadingRegister;

  Future<void> onRegister() async {
    if (registerFirstName.isEmpty ||
        registerLastName.isEmpty ||
        registerEmail.isEmpty ||
        registerNPassword.isEmpty ||
        registerCPassword.isEmpty) {
      setError(S.current.failed_email_password);
      return;
    }
    if (registerCPassword != registerNPassword) {
      setError(S.current.failed_match_password);
      return;
    }
    clearErrors();

    _loadingRegister = true;
    notifyListeners();

    await runBusyFuture(() async {
      try {
        var resp = await MFAdminAPI.register({
          'first_name': registerFirstName,
          'last_name': registerLastName,
          'email': registerEmail,
          'password': registerNPassword,
          'role': 'ADMIN',
          'is_blocked': false,
        });
        if (resp.isSuccessful && resp.code == 200) {
          await PrefService.instance.setToken(resp.data);
        } else {
          setError(resp.code == 201 ? resp.data : resp.message);
        }
      } catch (e) {
        Logger().e(e);
        setError(e);
      } finally {
        notifyListeners();
      }
    }());

    _loadingRegister = false;
    notifyListeners();
  }
}
