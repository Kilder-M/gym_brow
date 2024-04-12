import 'package:gymbrow/app/domain/entities/workout_entity.dart';
import 'package:gymbrow/app/domain/repositories/updates/update_workout_repository.dart';
import 'package:gymbrow/app/domain/usecases/updates/update_workout_usecase.dart';

class UpdateWorkoutUsecaseImp implements UpdateWorkoutUsecase {
  final UpdateWorkoutRepository _updateWorkoutRepository;

  UpdateWorkoutUsecaseImp(this._updateWorkoutRepository);

  @override
  Future<bool> call(WorkoutEntity workoutEntity) async {
    return await _updateWorkoutRepository(workoutEntity);
  }
}
