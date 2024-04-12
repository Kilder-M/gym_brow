import 'package:gymbrow/app/data/datasources/saves/save_workout_datasource.dart';
import 'package:gymbrow/app/domain/entities/workout_entity.dart';
import 'package:gymbrow/app/domain/repositories/saves/save_workout_repository.dart';

class SaveWorkoutRepositoryImp implements SaveWorkoutRepository {
  final SaveWorkoutDatasource _saveWorkoutDatasource;

  SaveWorkoutRepositoryImp(this._saveWorkoutDatasource);

  @override
  Future<bool> call(WorkoutEntity workoutEntity) async {
    return await _saveWorkoutDatasource(workoutEntity);
  }
}
