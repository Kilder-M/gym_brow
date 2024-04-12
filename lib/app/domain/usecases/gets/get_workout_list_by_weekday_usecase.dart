import 'package:gymbrow/app/domain/entities/workout_entity.dart';

abstract class GetWorkoutListByWeekdayUseCase {
  Future<List<WorkoutEntity>> call(int weekDay);
}
