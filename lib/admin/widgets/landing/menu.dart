import 'package:flutter/material.dart';
import 'package:mefit/admin/export.dart';

class LandingMenuView extends StatelessWidget {
  final LandingProvider vm;

  const LandingMenuView({
    super.key,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    var menu = [
      {
        'icon': const Icon(Icons.dashboard_outlined),
        'title': S.current.dashboard,
        'desc': 'MeFit Manager Plate',
        'type': LandingPageType.dashboard,
      },
      {},
      {
        'icon': const Icon(Icons.account_circle_outlined),
        'title': S.current.user_account,
        'desc': 'Joined Users Management',
        'type': LandingPageType.account,
      },
      {
        'icon': const Icon(Icons.golf_course),
        'title': '${S.current.course}s',
        'desc': 'Courses Management',
        'type': LandingPageType.course,
      },
      {
        'icon': const Icon(Icons.support),
        'title': S.current.support,
        'desc': 'MeFit Support Chat',
        'type': LandingPageType.support,
      },
      {},
      {
        'icon': const Icon(Icons.terminal),
        'title': S.current.terms_agreement,
        'desc': S.current.terms_agreement,
        'type': LandingPageType.terms,
      },
      {
        'icon': const Icon(Icons.terminal),
        'title': S.current.privacy_policy,
        'desc': S.current.privacy_policy,
        'type': LandingPageType.privacy,
      },
      {
        'icon': const Icon(Icons.settings_outlined),
        'title': S.current.settings,
        'desc': 'App Theme and Style',
        'type': LandingPageType.settings,
      },
    ];

    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: MTAdminTheme.instance?.colorScheme.surface,
        border: Border.all(
          color: MTAdminTheme.instance?.primary ?? const Color(0xFF000000),
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(16.0),
        // boxShadow: const [
        //   BoxShadow(
        //     blurRadius: 1.0,
        //     spreadRadius: 2.0,
        //     color: Colors.black12,
        //   ),
        // ],
      ),
      child: ListView(
        shrinkWrap: true,
        controller: vm.controller,
        children: menu.map((item) {
          return item['icon'] == null
              ? Container(
                  margin: const EdgeInsets.symmetric(vertical: 4.0),
                  height: 0.5,
                  color: Colors.blueGrey,
                )
              : ListTile(
                  leading: item['icon'] as Widget,
                  title: Text(item['title'] as String),
                  subtitle: Text(item['desc'] as String),
                  selected: item['type'] == vm.selectedPage,
                  onTap: () =>
                      vm.updatePageType(item['type'] as LandingPageType),
                );
        }).toList(),
      ),
    );
  }
}
