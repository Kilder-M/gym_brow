import 'package:gymbrow/app/domain/entities/workout_entity.dart';

abstract class UpdateWorkoutDatasource {
  Future<bool> call(WorkoutEntity workoutEntity);
}
