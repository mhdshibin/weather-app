import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:weather_app/constants/theme.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingFilling.square(
      borderColor: WTheme.primary,
      borderSize: 5.0,
      size: 100.0,
      backgroundColor: WTheme.secondary,
      duration: Duration(milliseconds: 1000),
    );
  }
}
