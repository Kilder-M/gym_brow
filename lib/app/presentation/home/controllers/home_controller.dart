import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymbrow/app/data/datasources/configurations_preferences/get_confguration_preference_datasource.dart';
import 'package:gymbrow/app/data/dtos/configuration_preference_dto.dart';
import 'package:gymbrow/app/presentation/home/views/settings_tab.dart';
import 'package:gymbrow/app/presentation/home/views/workout_days_tab.dart';

class HomeController extends GetxController {
  final getConfigurationPreferenceDataSource =
      Get.find<GetConfigurationPreferenceDataSource>();

  var selectedItem = 0.obs;

  RxBool isDarkTheme = false.obs;

  List<Widget> tabs = [
    const WorkoutDaysTab(),
    Container(
      child: Center(child: Text('2')),
    ),
    const SettingsTab(),
  ];

  setConfigurationPreference() async {
    ConfigurationPreferenceDTO? configurationPreference =
        await carregarConfigurationPreference();
    if (configurationPreference != null) {
      Get.changeTheme(
        configurationPreference.themeMode == ThemeModeEnum.dark.value
            ? ThemeData.dark()
            : ThemeData.light(),
      );
      isDarkTheme.value =
          configurationPreference.themeMode == ThemeModeEnum.dark.value
              ? true
              : false;
    }
  }

  Future<ConfigurationPreferenceDTO?> carregarConfigurationPreference() async {
    var response = await getConfigurationPreferenceDataSource();
    print(response);
    return response;
  }
}
