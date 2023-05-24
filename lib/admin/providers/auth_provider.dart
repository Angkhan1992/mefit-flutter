import 'package:flutter/material.dart';
import 'package:mefit/admin/export.dart';
import 'package:mefit/core/core.dart';

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

  Widget get content {
    return CustomScrollView(
      slivers: [
        WebSliverAppBar(
          context,
          onAuthTap: (isLogin) {
            _isLogin = isLogin;
            notifyListeners();
          },
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
                child: _isLogin ? _loginView : _registerView,
              ),
            ),
          ]),
        ),
      ],
    );
  }

  bool _isPassword = true;
  Widget get _loginView => Column(
        children: [
          Text(
            '${S.current.welcome} ${S.current.to} ${S.current.appname}'
                .toUpperCase(),
            style: MTAdminTheme.instance?.headerTitle,
          ),
          const SizedBox(height: 40.0),
          SizedBox(
            width: 400.0,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: '${S.current.email} ${S.current.address} *',
                prefixIcon: const Icon(Icons.email),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          SizedBox(
            width: 400.0,
            child: TextFormField(
              obscureText: _isPassword,
              decoration: InputDecoration(
                labelText: '${S.current.password} *',
                prefixIcon: const Icon(Icons.key),
                suffixIcon: InkWell(
                  onTap: () {
                    _isPassword = !_isPassword;
                    notifyListeners();
                  },
                  child: _isPassword
                      ? const Icon(Icons.lock)
                      : const Icon(Icons.lock_open),
                ),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 40.0),
          MTButton(
            // isLoading: true,
            title: S.current.login.toUpperCase(),
            onTap: () {},
          ),
          const SizedBox(height: 40.0),
          Text(
            '${S.current.login} ${S.current.with_}'.toUpperCase(),
            style: MTAdminTheme.instance?.appBarSubTitle,
          ),
          const SizedBox(height: 24.0),
          MTButton(
            title: '${S.current.login} ${S.current.with_} ${S.current.google}',
            background: Colors.redAccent,
            onTap: () {},
          ),
          const SizedBox(height: 8.0),
          MTButton(
            title: '${S.current.login} ${S.current.with_} ${S.current.apple}',
            background: Colors.black,
            onTap: () {},
          ),
        ],
      );

  bool _isSetPassword = true;
  bool _isConPassword = true;
  Widget get _registerView => Column(
        children: [
          Text(
            '${S.current.register} ${S.current.to} ${S.current.appname}'
                .toUpperCase(),
            style: MTAdminTheme.instance?.headerTitle,
          ),
          const SizedBox(height: 40.0),
          SizedBox(
            width: 400.0,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: '${S.current.first_name} *',
                prefixIcon: const Icon(Icons.account_circle),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          SizedBox(
            width: 400.0,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: '${S.current.last_name} *',
                prefixIcon: const Icon(Icons.account_circle),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          SizedBox(
            width: 400.0,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: '${S.current.email} ${S.current.address} *',
                prefixIcon: const Icon(Icons.email),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          SizedBox(
            width: 400.0,
            child: TextFormField(
              obscureText: _isSetPassword,
              decoration: InputDecoration(
                labelText: '${S.current.set_} ${S.current.password} *',
                prefixIcon: const Icon(Icons.key),
                suffixIcon: InkWell(
                  onTap: () {
                    _isSetPassword = !_isSetPassword;
                    notifyListeners();
                  },
                  child: _isSetPassword
                      ? const Icon(Icons.lock)
                      : const Icon(Icons.lock_open),
                ),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          SizedBox(
            width: 400.0,
            child: TextFormField(
              obscureText: _isConPassword,
              decoration: InputDecoration(
                labelText: '${S.current.confirm} ${S.current.password} *',
                prefixIcon: const Icon(Icons.key),
                suffixIcon: InkWell(
                  onTap: () {
                    _isConPassword = !_isConPassword;
                    notifyListeners();
                  },
                  child: _isConPassword
                      ? const Icon(Icons.lock)
                      : const Icon(Icons.lock_open),
                ),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 40.0),
          MTButton(
            title: S.current.register.toUpperCase(),
            onTap: () {},
          ),
          const SizedBox(height: 40.0),
          RichText(
            text: TextSpan(
              text: S.current.terms_agreement,
              style: TextStyle(
                color: MTAdminTheme.instance?.primary,
                decoration: TextDecoration.underline,
              ),
              children: [
                TextSpan(
                  text: '      ',
                  style: TextStyle(
                    color: MTAdminTheme.instance?.primary,
                    decoration: TextDecoration.none,
                  ),
                ),
                TextSpan(
                  text: S.current.privacy_policy,
                  style: TextStyle(
                    color: MTAdminTheme.instance?.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
