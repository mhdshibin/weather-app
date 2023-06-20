import 'package:flutter/material.dart';

import '../constants/enums.dart';
import 'loading_indicator.dart';

class StateBuilder extends StatelessWidget {
  final States state;
  final Widget loadingUi;

  Widget Function()? successUi, initialUi, failureUi;
  StateBuilder(
      {Key? key,
      required this.state,
      required this.initialUi,
      required this.failureUi,
      required this.successUi,
      this.loadingUi = const LoadingWidget()})
      : super(key: key);
  StateBuilder.twoState(
      {Key? key,
      required this.state,
      required this.initialUi,
      this.loadingUi = const LoadingWidget()})
      : assert(state == States.initial || state == States.loading),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    switch (state) {
      case States.initial:
        return initialUi!();
      case States.loading:
        return loadingUi;
      case States.success:
        return successUi!();
      case States.failed:
        return failureUi!();
    }
  }
}