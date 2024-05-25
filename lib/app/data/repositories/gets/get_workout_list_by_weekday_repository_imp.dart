import 'package:gymbrow/app/data/datasources/gets/get_workout_list_by_weekday_datasource.dart';
import 'package:gymbrow/app/domain/entities/workout_entity.dart';
import 'package:gymbrow/app/domain/repositories/gets/get_workout_list_by_weekday_repository.dart';

class GetWorkoutByWeekdayRepositoryImp
    implements GetWorkoutByWeekdayRepository {
  final GetWorkoutListByWeekdayDatasource _getWorkoutListByWeekdayDatasource;
  GetWorkoutByWeekdayRepositoryImp(this._getWorkoutListByWeekdayDatasource);

  @override
  Future<List<WorkoutEntity>> call(int weekDay) async {
    try {
      return _getWorkoutListByWeekdayDatasource(weekDay);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
