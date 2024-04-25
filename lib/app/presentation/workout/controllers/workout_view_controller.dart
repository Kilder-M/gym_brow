import 'package:get/get.dart';
import 'package:gymbrow/app/core/utils/models/weekday_dart';
import 'package:gymbrow/app/domain/entities/workout_entity.dart';
import 'package:gymbrow/app/domain/usecases/gets/get_workout_list_by_weekday_usecase.dart';

class WorkoutViewController extends GetxController {
  var selectedDay = 0.obs;

  Weekday weekday = Get.arguments;

  var workoutList = <WorkoutEntity>[].obs;

  final GetWorkoutListByWeekdayUseCase _getWorkoutListByweekday =
      Get.find<GetWorkoutListByWeekdayUseCase>();

  Future<List<WorkoutEntity>> listar() async {
    return workoutList.value = await _getWorkoutListByweekday(weekday.id);
  }
}
