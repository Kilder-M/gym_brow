import 'package:gymbrow/app/data/datasources/deletes/delete_workout_datasource.dart';
import 'package:gymbrow/app/data/services/database/sqflite/get_database_sqlite_imp.dart';
import 'package:gymbrow/app/domain/entities/workout_entity.dart';

class DeleteWorkoutLocalDatasourceImp implements DeleteWorkoutDatasource {
  final GetDatabaseSQLiteImp _databaseSQLiteImp;

  DeleteWorkoutLocalDatasourceImp(this._databaseSQLiteImp);

  @override
  Future<bool> call(WorkoutEntity workoutEntity) async {
    final databaseResponse = await _databaseSQLiteImp();
    const deleteWorkoutScript = '''
      DELETE FROM workout WHERE id = ?
    ''';
    int deletedWorkoutResponse = await databaseResponse
        .rawDelete(deleteWorkoutScript, [workoutEntity.id]);
    return deletedWorkoutResponse != 0 && deletedWorkoutResponse != 0
        ? true
        : false;
  }
}
