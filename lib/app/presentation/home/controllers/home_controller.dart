import 'package:get/get.dart';
import 'package:gymbrow/app/data/services/database/sqflite/get_database_sqlite_imp.dart';
import 'package:gymbrow/app/domain/entities/workout_entity.dart';
import 'package:gymbrow/app/domain/usecases/gets/get_workout_list_by_weekday_usecase.dart';
import 'package:sqflite/sqflite.dart';

class HomeController extends GetxController {
  final GetWorkoutListByWeekdayUseCase _getWorkoutListByweekday =
      Get.find<GetWorkoutListByWeekdayUseCase>();
  final GetDatabaseSQLiteImp _getDatabaseSQLiteImp =
      Get.find<GetDatabaseSQLiteImp>();

  var workoutList = <WorkoutEntity>[].obs;

  Future<List<WorkoutEntity>> listar() async {
    return workoutList.value =
        await _getWorkoutListByweekday(4);
  }

  Future<int> test() async {
    final db = await _getDatabaseSQLiteImp();
    return db.getVersion();
  }
}
