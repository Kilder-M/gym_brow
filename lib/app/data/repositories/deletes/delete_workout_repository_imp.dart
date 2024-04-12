import 'package:gymbrow/app/data/datasources/deletes/delete_workout_datasource.dart';
import 'package:gymbrow/app/domain/entities/workout_entity.dart';
import 'package:gymbrow/app/domain/repositories/deletes/delete_workout_repository.dart';

class DeleteWorkoutRepositoryImp implements DeleteWorkoutRepository{
  final DeleteWorkoutDatasource _deleteWorkoutDatasource;

  DeleteWorkoutRepositoryImp(this._deleteWorkoutDatasource);

  @override
  Future<bool> call(WorkoutEntity workoutEntity) async{
    return await _deleteWorkoutDatasource(workoutEntity);
  }

}