import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  var selectedItem = 0.obs;

  List<Widget> tabs = [
    Container(child: Center(child : Text('1')),),
    Container(child: Center(child : Text('2')),),
    Container(child: Center(child : Text('3')),),
    Container(child: Center(child : Text('4')),),
  ];

  // final GetWorkoutListByWeekdayUseCase _getWorkoutListByweekday =
  //     Get.find<GetWorkoutListByWeekdayUseCase>();
  // final GetDatabaseSQLiteImp _getDatabaseSQLiteImp =
  //     Get.find<GetDatabaseSQLiteImp>();

  // var workoutList = <WorkoutEntity>[].obs;

  // Future<List<WorkoutEntity>> listar() async {
  //   return workoutList.value =
  //       await _getWorkoutListByweekday(4);
  // }

  // Future<int> test() async {
  //   final db = await _getDatabaseSQLiteImp();
  //   return db.getVersion();
  // }
}
