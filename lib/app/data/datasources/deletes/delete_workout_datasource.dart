import 'package:gymbrow/app/domain/entities/workout_entity.dart';

abstract class DeleteWorkoutDatasource {
  Future<bool> call(WorkoutEntity workoutEntity);
}
