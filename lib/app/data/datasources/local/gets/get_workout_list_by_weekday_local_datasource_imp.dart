import 'package:gymbrow/app/data/datasources/gets/get_workout_list_by_weekday_datasource.dart';
import 'package:gymbrow/app/data/dtos/workout_dto.dart';
import 'package:gymbrow/app/data/services/database/sqflite/get_database_sqlite_imp.dart';
import 'package:gymbrow/app/domain/entities/workout_entity.dart';

class GetWorkoutListByWeekdayLocalDataSourceImp
    implements GetWorkoutListByWeekdayDatasource {
  final GetDatabaseSQLiteImp _databaseSQLiteImp;

  GetWorkoutListByWeekdayLocalDataSourceImp(this._databaseSQLiteImp);

  @override
  Future<List<WorkoutEntity>> call(int weekDay) async {
    final databaseResponse = await _databaseSQLiteImp();
    List<Map<String, dynamic>> queryResponse;
    try {
      queryResponse = await databaseResponse
          .query('workout', where: 'weekday = ?', whereArgs: [weekDay]);
    } on Exception catch (e) {
      throw Exception(e);
    }
    List<WorkoutDTO> workoutList = List.generate(queryResponse.length, (index) {
      var element = queryResponse[index];
      var a = WorkoutDTO.fromMapLocalDataBase(element);
      print(a.toJsonLocalDataBase());
      return a;
    });
    return workoutList;
  }
}
