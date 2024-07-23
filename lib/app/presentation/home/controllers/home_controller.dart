import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymbrow/app/data/datasources/configurations_preferences/get_confguration_preference_datasource.dart';
import 'package:gymbrow/app/data/datasources/configurations_preferences/update_confguration_preference_datasource.dart';
import 'package:gymbrow/app/data/dtos/configuration_preference_dto.dart';
import 'package:gymbrow/app/presentation/home/views/settings_tab.dart';
import 'package:gymbrow/app/presentation/home/views/workout_days_tab.dart';

class HomeController extends GetxController {
  final getConfigurationPreferenceDataSource =
      Get.find<GetConfigurationPreferenceDataSource>();
  final updateConfigurationPreferenceDataSource =
      Get.find<UpdateConfigurationPreferenceDataSource>();

  var selectedItem = 0.obs;

  late ConfigurationPreferenceDTO configurationPreferenceDTO;

  RxBool isDarkTheme = false.obs;

  List<Widget> tabs = [
    const WorkoutDaysTab(),
    const Center(child: Text('2')),
    const SettingsTab(),
  ];

  Future<ConfigurationPreferenceDTO?> loadConfigurationPreference() async {
    configurationPreferenceDTO = await getConfigurationPreferenceDataSource();
    print(configurationPreferenceDTO);
    return configurationPreferenceDTO;
  }

  setConfigurationPreference() async {
    ConfigurationPreferenceDTO? configurationPreference =
        await loadConfigurationPreference();
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

  Future<bool> changeThemeMode() async {
    configurationPreferenceDTO.themeMode = isDarkTheme.value ? 1 : 0;
    try {
      await updateConfigurationPreferenceDataSource(configurationPreferenceDTO);
      Get.changeTheme(
        isDarkTheme.value ? ThemeData.dark() : ThemeData.light(),
      );
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }
}
