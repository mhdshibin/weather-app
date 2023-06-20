import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:get/get.dart';
import 'package:weather_app/constants/theme.dart';
import 'package:weather_app/widgets/weather_code.dart';
import 'package:weather_app/widgets/forcast_tile.dart';
import 'package:weather_icons/weather_icons.dart';

import '../../../../widgets/state_builder.dart';
import '../controllers/weather_controller.dart';

class WeatherView extends GetView<WeatherController> {
  const WeatherView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: WTheme.bg,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: WTheme.primary,
            title: const Text("Location"),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: _buildSearchBar(),
              )
            ],
            // centerTitle: true,
          ),
          body: GetBuilder<WeatherController>(
            builder: (_) => _buildUi(),
          )),
    );
  }

  AnimSearchBar _buildSearchBar() {
    return AnimSearchBar(
      width: 0.7 * Get.width,
      textController: controller.textEditingController,
      onSuffixTap: controller.onSuffixTapped,
      onSubmitted: controller.onSubmitted,
      color: WTheme.white,
      textFieldColor: WTheme.white,
      searchIconColor: WTheme.secondary,
      textFieldIconColor: WTheme.secondary,
      style: const TextStyle(color: WTheme.primary),
    );
  }

  Widget _buildUi() {
    return StateBuilder(
      state: controller.editStates,
      initialUi: _buildSuccessUi,
      failureUi: _buildFailureUi,
      successUi: _buildInitialUi,
    );
  }

  Widget _buildInitialUi() {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          _buildCFSwitcher(),
          const SizedBox(height: 20),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text(
                  controller.locationName ?? "--",
                  style: const TextStyle(
                    fontSize: 40,
                    color: WTheme.white,
                  ),
                ),
                Text(
                  controller.toggleValue
                      ? '${controller.cDegrees?.toStringAsFixed(1)}${controller.suffixChar}'
                      : '${controller.fDegrees?.toStringAsFixed(1)}${controller.suffixChar}',
                  style: const TextStyle(
                    fontSize: 60,
                    color: WTheme.white,
                  ),
                ),
                WeatherIcon(
                    wID: weatherCodeIconMapper(controller.weatherCode ?? 0)),
                // Text(
                //   "ThunderStorm",
                //   style: const TextStyle(
                //     fontSize: 20,
                //     color: WTheme.white,
                //   ),
                // ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: WTheme.primary),
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => ForcastTileWidget(
                        day: controller.day?[index] ?? "",
                        degree: controller.degree?[index] ?? 0,
                        wIcon: controller.wIcon?[index] ??
                            WeatherIcon(
                                wID: WeatherIconDescription(
                                    icon: WeatherIcons.cloud,
                                    desc: 'Clear Day')),
                      )
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Text("Date"),
                  //     Text("Temperature"),
                  //     Text("Icon")
                  //   ],
                  // ),
                  ),
            ),
          ),
        ],
      ),
    );
  }

  FlutterSwitch _buildCFSwitcher() {
    return FlutterSwitch(
      showOnOff: true,
      width: 150,
      height: 50,
      toggleSize: 40,
      padding: 10,
      activeText: "Celsius",
      activeColor: WTheme.white,
      activeTextColor: WTheme.primary,
      activeToggleColor: WTheme.primary,
      activeTextFontWeight: FontWeight.bold,
      inactiveText: "Fahrenheit",
      inactiveColor: WTheme.white,
      inactiveTextColor: WTheme.primary,
      inactiveToggleColor: WTheme.primary,
      inactiveTextFontWeight: FontWeight.bold,
      value: controller.toggleValue,
      onToggle: controller.onSwitchToggle,
    );
  }

  Widget _buildSuccessUi() {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Text(
                "Pick a Location",
                style: const TextStyle(
                  fontSize: 40,
                  color: WTheme.white,
                ),
              ),
            ],
          ),
          Container(
            height: Get.height * 0.8,
            child: ListView.builder(itemCount: 7, itemBuilder: (context, index) {
              // return Container();
              return ListTile(
                  title: TextButton(
                      onPressed: controller.onOptionSelected(index),
                      child: Text(controller.options[index])));
            }),
          )
        ],
      ),
    );
  }

  Widget _buildFailureUi() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Text(
              controller.locationName ?? "",
              style: const TextStyle(
                fontSize: 40,
                color: WTheme.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
