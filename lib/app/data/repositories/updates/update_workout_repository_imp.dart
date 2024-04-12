import 'package:gymbrow/app/data/datasources/updates/update_workout_datasource.dart';
import 'package:gymbrow/app/domain/entities/workout_entity.dart';
import 'package:gymbrow/app/domain/repositories/updates/update_workout_repository.dart';

class UpdateWorkoutRepositoryImp implements UpdateWorkoutRepository{

  final UpdateWorkoutDatasource _updateWorkoutDatasource;

  UpdateWorkoutRepositoryImp(this._updateWorkoutDatasource);

  @override
  Future<bool> call(WorkoutEntity workoutEntity) async{
    return await _updateWorkoutDatasource(workoutEntity);
  }

}