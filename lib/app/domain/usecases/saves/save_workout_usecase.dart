import 'package:gymbrow/app/domain/entities/workout_entity.dart';

abstract class SaveWorkoutUsecase{
  Future<bool> call(WorkoutEntity workoutEntity);
}