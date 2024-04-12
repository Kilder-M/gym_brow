import 'package:gymbrow/app/domain/entities/workout_entity.dart';

abstract class GetWorkoutByWeekdayRepository{
  Future<List<WorkoutEntity>> call(int weekDay);
}