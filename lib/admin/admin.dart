import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mefit/services/pref_service.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import 'package:mefit/admin/export.dart';
import 'package:mefit/core/core.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..maxConnectionsPerHost = 100
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  FlutterError.onError = (FlutterErrorDetails details) {
    Logger().e('Error: $details');
  };

  var token = await PrefService.instance.getToken();
  runApp(AdminWeb(
    isLogin: token != null,
  ));
}

final Navigation _navigation = Navigation();

class AdminWeb extends StatelessWidget {
  final bool isLogin;
  const AdminWeb({
    super.key,
    required this.isLogin,
  });

  @override
  Widget build(BuildContext context) {
    MTAdminTheme.initWithContext(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MeFitProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
      ],
      child: ViewModelBuilder<MeFitProvider>.reactive(
        viewModelBuilder: () => MeFitProvider(),
        builder: (context, vm, _) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: vm.themeMode() ?? ThemeMode.system,
            theme: ThemeData(fontFamily: 'SourceSansPro'),
            home: isLogin ? const LandingPage() : const LoginPage(),
            onGenerateRoute: _navigation.router.generator,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
          );
        },
      ),
    );
  }
}
