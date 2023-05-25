import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:mefit/admin/export.dart';
import 'package:mefit/core/core.dart';
import 'package:stacked/stacked.dart';

class MTWebBaseView<T extends MFBaseViewModel> extends StatelessWidget {
  final T Function() viewModelBuilder;
  final dynamic Function(T)? onViewModelReady;
  final Widget? Function(BuildContext, T, FlutterErrorDetails)? stErrorWidget;
  final Widget Function(BuildContext, MTLayoutService, T, Widget?) stBuilder;
  final bool hasLoading;

  const MTWebBaseView({
    super.key,
    required this.viewModelBuilder,
    this.onViewModelReady,
    required this.stBuilder,
    this.stErrorWidget,
    this.hasLoading = true,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<T>.reactive(
      onViewModelReady: onViewModelReady,
      viewModelBuilder: viewModelBuilder,
      builder: (ctx, vm, widget) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          if (stErrorWidget != null &&
              stErrorWidget!(ctx, vm, errorDetails) != null) {
            return stErrorWidget!(ctx, vm, errorDetails)!;
          }
          return MTOopsPage(onRefersh: () => vm.fetchData());
        };
        return Stack(
          children: [
            Scaffold(
              body: LayoutBuilder(
                builder: (context, constraints) {
                  return stBuilder(
                    context,
                    MTLayoutService.of(constraints),
                    vm,
                    widget,
                  );
                },
              ),
            ),
            if (vm.isBusy && hasLoading) ...{
              const Positioned.fill(
                child: MTLoader(),
              )
            },
          ],
        );
      },
    );
  }
}

class MTLayoutService {
  BoxConstraints constraints;

  MTLayoutService(this.constraints);

  factory MTLayoutService.of(BoxConstraints constraints) {
    return MTLayoutService(constraints);
  }
}

class MTOopsPage extends StatelessWidget {
  final Function()? onRefersh;

  const MTOopsPage({
    super.key,
    this.onRefersh,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MTLoader extends StatelessWidget {
  const MTLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 150.0,
        height: 150.0,
        child: LoadingIndicator(
          indicatorType: Indicator.ballClipRotateMultiple,
          colors: [MTAdminTheme.instance!.primary],
          strokeWidth: 2,
          backgroundColor: Colors.transparent,
          pathBackgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
