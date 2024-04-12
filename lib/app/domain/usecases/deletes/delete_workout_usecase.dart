import 'package:gymbrow/app/domain/entities/workout_entity.dart';

abstract class DeleteWorkoutUsecase{
  Future<bool> call(WorkoutEntity workoutEntity);
}