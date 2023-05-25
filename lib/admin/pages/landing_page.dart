import 'package:flutter/material.dart';
import 'package:mefit/admin/export.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MTWebBaseView<LandingProvider>(
      viewModelBuilder: () => LandingProvider(),
      onViewModelReady: (vm) => vm.init(context),
      stBuilder: (context, app, vm, _) {
        return CustomScrollView(
          controller: vm.controller,
          physics: const BouncingScrollPhysics(),
          slivers: [
            WebSliverAppBar(
              context,
              user: vm.user,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      constraints: const BoxConstraints(maxWidth: 1200.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: LandingMenuView(vm: vm),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: const EdgeInsets.all(24.0),
                              child: vm.contentView,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ],
        );
      },
      hasLoading: false,
    );
  }
}
