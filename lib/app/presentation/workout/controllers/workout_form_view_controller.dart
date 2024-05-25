import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymbrow/app/core/utils/models/weekday_dart';
import 'package:gymbrow/app/domain/entities/workout_entity.dart';
import 'package:gymbrow/app/domain/usecases/saves/save_workout_usecase.dart';

class WorkoutFormViewController extends GetxController {
  final SaveWorkoutUsecase _saveWorkoutUsecase = Get.find<SaveWorkoutUsecase>();
  Weekday weekDay = Get.arguments;

  final formKey = GlobalKey<FormState>();

  WorkoutEntity workoutEntity = WorkoutEntity(
    weight: 0.0,
    name: '',
    series: 0,
    repetitions: 0,
    restTime: 0.0,
    isDone: false,
    weekDay: DateTime.now().day,
  );

  WorkoutFormViewController() {
    workoutEntity.weekDay = weekDay.id;
  }

  Future<bool> saveWorkoutUsecase() async {
    var result = await _saveWorkoutUsecase(workoutEntity);
    if (result) {
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
