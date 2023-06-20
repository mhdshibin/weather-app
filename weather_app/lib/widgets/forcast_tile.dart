import 'package:flutter/material.dart';
import 'package:weather_app/widgets/weather_code.dart';

class ForcastTileWidget extends StatefulWidget {
  final String day;
  final double degree;
  final WeatherIcon wIcon;
  ForcastTileWidget(
      {Key? key, required this.day, required this.degree, required this.wIcon})
      : super(key: key);

  @override
  State<ForcastTileWidget> createState() => _ForcastTileWidgetState();
}

class _ForcastTileWidgetState extends State<ForcastTileWidget> {
  @override
  Widget build(BuildContext context) {
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //   children: [
    //   Text(widget.day),
    //   Text("${widget.degree}°"),
    //   widget.wIcon,
    // ]);
    return ListTile(
      // dense: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      leading: Text(widget.day),
      trailing: Text("${widget.degree}°"),
      title: widget.wIcon,
    );
  }
}
