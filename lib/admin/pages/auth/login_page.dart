import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mefit/admin/export.dart';
import 'package:mefit/r.dart' as R;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MTWebBaseView<AuthProvider>(
      viewModelBuilder: () => AuthProvider(),
      onViewModelReady: (vm) => vm.init(context),
      stBuilder: (context, app, vm, _) => Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              R.AssetImages.imgExercise,
            ),
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: vm.content,
        ),
      ),
      hasLoading: false,
    );
  }
}
