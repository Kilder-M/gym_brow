import 'package:gymbrow/app/domain/entities/workout_entity.dart';
import 'package:gymbrow/app/domain/repositories/gets/get_workout_list_by_weekday_repository.dart';
import 'package:gymbrow/app/domain/usecases/gets/get_workout_list_by_weekday_usecase.dart';

class GetWorkoutListByWeekdayUseCaseImp
    implements GetWorkoutListByWeekdayUseCase {
  final GetWorkoutByWeekdayRepository _getWorkoutByWeekdayRepository;

  GetWorkoutListByWeekdayUseCaseImp(this._getWorkoutByWeekdayRepository);

  @override
  Future<List<WorkoutEntity>> call(int weekDay) async {
    return await _getWorkoutByWeekdayRepository.call(weekDay);
  }
}
