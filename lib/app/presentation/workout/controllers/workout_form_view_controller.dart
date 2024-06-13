import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymbrow/app/core/utils/models/weekday_dart';
import 'package:gymbrow/app/domain/entities/workout_entity.dart';
import 'package:gymbrow/app/domain/usecases/saves/save_workout_usecase.dart';
import 'package:gymbrow/app/domain/usecases/updates/update_workout_usecase.dart';
import 'package:gymbrow/app/presentation/workout/controllers/workout_view_controller.dart';

class WorkoutFormViewController extends GetxController {
  final SaveWorkoutUsecase _saveWorkoutUsecase = Get.find<SaveWorkoutUsecase>();
  final UpdateWorkoutUsecase _updateWorkoutUsecase =
      Get.find<UpdateWorkoutUsecase>();
  final WorkoutViewController _workoutViewController =
      Get.find<WorkoutViewController>();

  Weekday weekDay = Get.arguments[0];

  final formKey = GlobalKey<FormState>();

  WorkoutEntity workoutEntity = Get.arguments[1];

  WorkoutFormViewController() {
    workoutEntity.weekDay = weekDay.id;
  }

  Future<bool> saveWorkoutUsecase() async {
    try {
      var result = await _saveWorkoutUsecase(workoutEntity);
      _workoutViewController.listWorkouts();
      print('salvou com sucesso');
      return result;
    } on Exception catch (e) {
      print('n salvou');
      throw Exception(e);
    }
  }

  Future<bool> updateWorkoutUsecase() async {
    var result = await _updateWorkoutUsecase(workoutEntity);
    if (result) {
      _workoutViewController.listWorkouts();
      print('salvou com sucesso');
    } else {
      print('n salvou');
    }
    return result;
  }

  String? nameValidator(String? text) {
    if (text == null || text.isEmpty) {
      return 'Obrigatorio';
    }
    return null;
  }

  String? doubleValidator(String? text) {
    RegExp regex = RegExp(r'^[+-]?([0-9]*[.])?[0-9]+$');

    if (text == null || text.isEmpty) {
      return 'Obrigatorio';
    }
    if (!regex.hasMatch(text)) {
      return 'Inválido';
    }
    return null;
  }

  String? repetitionsValidator(String? text) {
    RegExp regex = RegExp(r'^\d+$');

    if (text == null || text.isEmpty) {
      return 'Obrigatorio';
    }
    if (!regex.hasMatch(text)) {
      return 'Inválido';
    }
    return null;
  }
}
