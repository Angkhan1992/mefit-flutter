import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/material.dart';
import 'package:mefit/admin/export.dart';

class Navigation {
  final router = fluro.FluroRouter();

  Navigation() {
    defineRoutes();
  }

  defineRoutes() {
    initRoute(
      '/landing',
      (props) => const LandingPage(),
      transitionType: fluro.TransitionType.none,
    );

    initRoute(
      '/login',
      (props) => const LoginPage(),
      transitionType: fluro.TransitionType.none,
    );
  }

  initRoute<T>(
    String route,
    Function(T? props) init, {
    fluro.TransitionType? transitionType,
  }) {
    router.define(
      route,
      handler: fluro.Handler(handlerFunc: (BuildContext? context, _) {
        final T? props = ModalRoute.of(context!)!.settings.arguments as T?;
        return init(props);
      }),
      transitionType: transitionType ?? fluro.TransitionType.native,
    );
  }
}
