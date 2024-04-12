import 'package:gymbrow/app/domain/entities/workout_entity.dart';

abstract class UpdateWorkoutUsecase {
  Future<bool> call(WorkoutEntity workoutEntity);
}
