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
        ,sets = ?
        ,rest_time = ?
        ,weight = ?
        ,is_done = ?
        ,image_url = ?
        ,weekday = ?
        ,observations = ?
        WHERE id = ?
      ''';
    try {
      final updateResponse = await databaseResponse.rawUpdate(
        sql,
        [
          workoutEntity.name,
          workoutEntity.series,
          workoutEntity.sets,
          workoutEntity.restTime,
          workoutEntity.weight,
          workoutEntity.isDone == true ? 1 : 0,
          workoutEntity.imageUrl,
          workoutEntity.weekDay,
          workoutEntity.observations,
          workoutEntity.id
        ],
      );
      return updateResponse != 0 ? true : false;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
