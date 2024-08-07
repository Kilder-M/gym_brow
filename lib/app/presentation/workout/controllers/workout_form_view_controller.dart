import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymbrow/app/core/utils/models/weekday_dart';
import 'package:gymbrow/app/domain/entities/workout_entity.dart';
import 'package:gymbrow/app/domain/usecases/saves/save_workout_usecase.dart';
import 'package:gymbrow/app/domain/usecases/updates/update_workout_usecase.dart';
import 'package:gymbrow/app/presentation/workout/controllers/workout_view_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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

 var intTextMask = MaskTextInputFormatter(mask: '#');
 var doubleTextMask = MaskTextInputFormatter(mask: '#.#');

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

  String? nameValidator(String? text,BuildContext context) {
    int maxLengh = 100;
    if (text == null || text.isEmpty) {
      return AppLocalizations.of(context)!.required;
    }if(text.length > maxLengh){
      return AppLocalizations.of(context)!.max_length_erro_text;
    }
    return null;
  }

  String? doubleValidator(String? text,BuildContext context) {
    RegExp regex = RegExp(r'^[+-]?([0-9]*[.])?[0-9]+$');

    if (text == null || text.isEmpty) {
      return AppLocalizations.of(context)!.required;
    }
    if (!regex.hasMatch(text)) {
      return AppLocalizations.of(context)!.invalid;
    }
    return null;
  }

  String? setsValidator(String? text,BuildContext context) {
    final RegExp regex = RegExp(r'^\d+$');

    if (text == null || text.isEmpty) {
      return AppLocalizations.of(context)!.required;
    }
    if (!regex.hasMatch(text)) {
      return AppLocalizations.of(context)!.invalid;
    }
    return null;
  }
}
