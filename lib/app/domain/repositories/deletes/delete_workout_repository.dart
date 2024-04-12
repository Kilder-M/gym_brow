import 'package:gymbrow/app/domain/entities/workout_entity.dart';

abstract class DeleteWorkoutRepository {
  Future<bool> call(WorkoutEntity workoutEntity);
}