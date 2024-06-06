import 'package:gymbrow/app/data/datasources/saves/save_workout_datasource.dart';
import 'package:gymbrow/app/data/services/database/sqflite/get_database_sqlite_imp.dart';
import 'package:gymbrow/app/domain/entities/workout_entity.dart';

class SaveWorkoutLocalDatasourceImp implements SaveWorkoutDatasource {
  final GetDatabaseSQLiteImp _databaseSQLiteImp;

  SaveWorkoutLocalDatasourceImp(this._databaseSQLiteImp);

  @override
  Future<bool> call(WorkoutEntity workoutEntity) async {
    final databaseResponse = await _databaseSQLiteImp();
    const sql =
        '''INSERT INTO workout(name,series,repetitions,rest_time,weight,is_done,image_url,weekday,observations)
        VALUES(?,?,?,?,?,?,?,?,?)
        ''';
    try {
      final saveResponse = await databaseResponse.rawInsert(sql, [
        workoutEntity.name,
        workoutEntity.series,
        workoutEntity.repetitions,
        workoutEntity.restTime,
        workoutEntity.weight,
        workoutEntity.isDone == true ? 1 : 0,
        workoutEntity.imageUrl,
        workoutEntity.weekDay,
        workoutEntity.observations,
      ]);
      print(workoutEntity.toString());

      return saveResponse != 0 ? true : false;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
