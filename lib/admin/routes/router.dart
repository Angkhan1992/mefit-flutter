import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/material.dart';
import 'package:mefit/admin/export.dart';

class Navigation {
  final router = fluro.FluroRouter();

  Navigation() {
    defineRoutes();
  }

  defineRoutes() {
    router.define(
      '/landing',
      handler: fluro.Handler(
        handlerFunc: (BuildContext? context, _) => const LandingPage(),
      ),
      transitionType: fluro.TransitionType.native,
    );

    router.define(
      '/login',
      handler: fluro.Handler(
        handlerFunc: (BuildContext? context, _) => const LoginPage(),
      ),
      transitionType: fluro.TransitionType.native,
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
