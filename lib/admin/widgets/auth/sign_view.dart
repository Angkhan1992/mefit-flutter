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
          onTap: () => vm.onLogin().then((value) {
            if (vm.hasError) {
              CoreDialog.of(context).showSnakeBar(
                desc: vm.modelError.toString(),
                type: ToastStatus.failed,
              );
              return;
            }
            Routers.goToLanding(context);
          }),
        ),
        const SizedBox(height: 40.0),
        Text(
          '${S.current.login} ${S.current.with_}'.toUpperCase(),
          style: MTAdminTheme.instance?.subTitle,
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

class RegisterView extends StatelessWidget {
  final AuthProvider vm;

  const RegisterView({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            onChanged: (value) => vm.registerFirstName = value,
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
            onChanged: (value) => vm.registerLastName = value,
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
            onChanged: (value) => vm.registerEmail = value,
          ),
        ),
        const SizedBox(height: 24.0),
        SizedBox(
          width: 400.0,
          child: TextFormField(
            obscureText: vm.isSetPassword,
            decoration: InputDecoration(
              labelText: '${S.current.new_} ${S.current.password} *',
              prefixIcon: const Icon(Icons.key),
              suffixIcon: InkWell(
                onTap: vm.updateSetPassword,
                child: vm.isSetPassword
                    ? const Icon(Icons.lock)
                    : const Icon(Icons.lock_open),
              ),
              border: const OutlineInputBorder(),
            ),
            onChanged: (value) => vm.registerNPassword = value,
          ),
        ),
        const SizedBox(height: 24.0),
        SizedBox(
          width: 400.0,
          child: TextFormField(
            obscureText: vm.isConPassword,
            decoration: InputDecoration(
              labelText: '${S.current.confirm} ${S.current.password} *',
              prefixIcon: const Icon(Icons.key),
              suffixIcon: InkWell(
                onTap: vm.updateConPassword,
                child: vm.isConPassword
                    ? const Icon(Icons.lock)
                    : const Icon(Icons.lock_open),
              ),
              border: const OutlineInputBorder(),
            ),
            onChanged: (value) => vm.registerCPassword = value,
          ),
        ),
        const SizedBox(height: 40.0),
        MTButton(
          title: S.current.register.toUpperCase(),
          onTap: () => vm.onRegister().then((value) {
            if (vm.hasError) {
              CoreDialog.of(context).showSnakeBar(
                desc: vm.modelError.toString(),
                type: ToastStatus.failed,
              );
              return;
            }
            vm.changePage(true);
          }),
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
}
