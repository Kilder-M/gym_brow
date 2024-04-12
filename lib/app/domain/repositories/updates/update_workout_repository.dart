import 'package:gymbrow/app/domain/entities/workout_entity.dart';

abstract class UpdateWorkoutRepository {
  Future<bool> call(WorkoutEntity workoutEntity);
}
