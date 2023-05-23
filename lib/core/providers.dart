import 'package:flutter/material.dart';
import 'package:mefit/services/services.dart';
import 'package:stacked/stacked.dart';

class MeFitProvider extends BaseViewModel {
  var themeIndex = 0;

  Future<void> initialize() async {
    themeIndex = await PrefService.instance.getTheme();
    notifyListeners();
  }

  ThemeMode? themeMode() {
    if (themeIndex == 0) return null;
    return themeIndex == 1 ? ThemeMode.light : ThemeMode.dark;
  }

  Future<void> updateTheme(int index) async {
    await PrefService.instance.setTheme(index);
    themeIndex = index;
    notifyListeners();
  }
}

abstract class MFBaseViewModel extends BaseViewModel {
  late BuildContext context;

  void init(BuildContext context) {
    this.context = context;
  }

  Future<void> fetchData();
}
