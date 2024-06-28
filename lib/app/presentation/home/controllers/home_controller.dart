import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymbrow/app/presentation/home/views/settings_tab.dart';
import 'package:gymbrow/app/presentation/home/views/workout_days_tab.dart';

class HomeController extends GetxController {
  var selectedItem = 0.obs;

  RxBool isDarkTheme = false.obs ;

  List<Widget> tabs = [
    const WorkoutDaysTab(),
    Container(
      child: Center(child: Text('2')),
    ),
    const SettingsTab(),
  ];
}
