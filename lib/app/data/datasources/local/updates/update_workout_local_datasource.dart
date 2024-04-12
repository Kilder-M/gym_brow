import 'package:gymbrow/app/data/datasources/updates/update_workout_datasource.dart';
import 'package:gymbrow/app/data/services/database/sqflite/get_database_sqlite_imp.dart';
import 'package:gymbrow/app/domain/entities/workout_entity.dart';

class UpdateWorkoutLocalDatasourceImp implements UpdateWorkoutDatasource {
  final GetDatabaseSQLiteImp _getDatabaseSQLiteImp;

  UpdateWorkoutLocalDatasourceImp(this._getDatabaseSQLiteImp);

  @override
  Future<bool> call(WorkoutEntity workoutEntity) async {
    final databaseResponse = await _getDatabaseSQLiteImp();
    const sql = '''
        UPDATE workout SET name = ?
        ,series = ?
        ,repetitions = ?
        ,rest_time = ?
        ,weight = ?
        ,is_done
        ,image_url
        ,weekday = ? WHERE id = ?
      ''';
    final updateResponse = await databaseResponse.rawUpdate(
      sql,
      [
        workoutEntity.name,
        workoutEntity.series,
        workoutEntity.repetitions,
        workoutEntity.restTime,
        workoutEntity.weight,
        workoutEntity.isDone,
        workoutEntity.imageUrl,
        workoutEntity.weekDay,
      ],
    );
    return updateResponse != 0 ? true : false;
  }
}
