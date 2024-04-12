import 'package:gymbrow/app/domain/entities/workout_entity.dart';

abstract class SaveWorkoutDatasource {
  Future<bool> call(WorkoutEntity workoutEntity);
}
