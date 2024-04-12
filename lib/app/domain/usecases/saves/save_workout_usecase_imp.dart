import 'package:gymbrow/app/domain/entities/workout_entity.dart';
import 'package:gymbrow/app/domain/repositories/saves/save_workout_repository.dart';
import 'package:gymbrow/app/domain/usecases/saves/save_workout_usecase.dart';

class SaveWorkoutUsecaseImp implements SaveWorkoutUsecase {
  final SaveWorkoutRepository _saveWorkoutRepository;

  SaveWorkoutUsecaseImp(this._saveWorkoutRepository);

  @override
  Future<bool> call(WorkoutEntity workoutEntity) async {
    return await _saveWorkoutRepository(workoutEntity);
  }
}
