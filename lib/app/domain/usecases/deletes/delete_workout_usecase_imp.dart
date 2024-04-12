import 'package:gymbrow/app/domain/entities/workout_entity.dart';
import 'package:gymbrow/app/domain/repositories/deletes/delete_workout_repository.dart';
import 'package:gymbrow/app/domain/usecases/deletes/delete_workout_usecase.dart';

class DeleteWorkoutUsecaseImp implements DeleteWorkoutUsecase {
  final DeleteWorkoutRepository _deleteWorkoutRepository;
  DeleteWorkoutUsecaseImp(this._deleteWorkoutRepository);
  @override
  Future<bool> call(WorkoutEntity workoutEntity) async {
    return await _deleteWorkoutRepository(workoutEntity);
  }
}
