import 'package:flutter/material.dart';
import 'package:mefit/admin/export.dart';
import 'package:mefit/core/core.dart';

class LoginView extends StatelessWidget {
  final AuthProvider vm;

  const LoginView({
    super.key,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
            onChanged: (value) => vm.loginEmail = value,
          ),
        ),
        const SizedBox(height: 24.0),
        SizedBox(
          width: 400.0,
          child: TextFormField(
            obscureText: vm.isPassword,
            decoration: InputDecoration(
              labelText: '${S.current.password} *',
              prefixIcon: const Icon(Icons.key),
              suffixIcon: InkWell(
                onTap: vm.updatePassword,
                child: vm.isPassword
                    ? const Icon(Icons.lock)
                    : const Icon(Icons.lock_open),
              ),
              border: const OutlineInputBorder(),
            ),
            onChanged: (value) => vm.loginPassword = value,
          ),
        ),
        const SizedBox(height: 40.0),
        MTButton(
          isLoading: vm.loadingLogin,
          title: S.current.login.toUpperCase(),
          onTap: () => vm.onLogin().then((user) {
            if (vm.hasError) {
              return;
            }
            Routers.goToLanding(context);
          }),
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
  }
}
