import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';
import 'package:stacked/stacked.dart';

import 'package:mefit/admin/export.dart';
import 'package:mefit/widgets/widgets.dart';

class LandingDashboardView extends StatelessWidget {
  final LandingProvider viewModel;
  const LandingDashboardView({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LandingDashboardProvider>.reactive(
      onViewModelReady: (vm) => vm.init(context),
      viewModelBuilder: () => LandingDashboardProvider(),
      builder: (context, vm, _) {
        if (vm.isBusy) {
          return Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2.0,
            alignment: Alignment.center,
            child: const MTLoader(),
          );
        }
        return ListView(
          shrinkWrap: true,
          controller: viewModel.controller,
          children: [
            Text(
              S.current.dashboard,
              style: MTAdminTheme.instance?.appBarTitle,
            ),
            const SizedBox(height: 24.0),
            ...{
              Row(
                children: vm.cardModels
                    .map((model) => LandingCardView(model: model))
                    .toList(),
              ),
            },
            const SizedBox(height: 16.0),
            ...{
              Text(
                'Recent Users (${vm.recentUsers.length})',
                style: MTAdminTheme.instance?.subTitle,
              ),
              const SizedBox(height: 16.0),
              ...vm.recentUsers
                  .map(
                    (user) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16.0),
                                  child: MTImage(
                                    user.avatar,
                                    width: 28.0,
                                    height: 28.0,
                                  ),
                                ),
                                const SizedBox(width: 16.0),
                                Text(user.firstName ?? ''),
                                const SizedBox(width: 4.0),
                                Text(user.lastName ?? ''),
                              ],
                            ),
                          ),
                          Expanded(child: Text(user.email ?? '')),
                          Expanded(child: Text(user.onMember ?? '')),
                          Container(
                            width: 80.0,
                            alignment: Alignment.centerRight,
                            child: Text(user.role ?? 'Unknown'.toUpperCase()),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList()
            }
          ],
        );
      },
    );
  }
}

class LandingCardView extends StatelessWidget {
  final LandingCardModel model;
  const LandingCardView({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Pigment.fromString(model.backgroundColor),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.title,
              style: MTAdminTheme.instance?.cardTitle.copyWith(
                color: Pigment.fromString(model.fontColor),
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  model.desc,
                  style: MTAdminTheme.instance?.cardContent.copyWith(
                    color: Pigment.fromString(model.fontColor),
                  ),
                ),
                Text(
                  '↓↑ ${model.value}%',
                  style: MTAdminTheme.instance?.cardTitle.copyWith(
                    color: Pigment.fromString(model.fontColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
