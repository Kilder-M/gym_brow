import 'package:gymbrow/app/domain/entities/workout_entity.dart';

abstract class GetWorkoutListByWeekdayDatasource {
  Future<List<WorkoutEntity>> call(int weekDay);
}
