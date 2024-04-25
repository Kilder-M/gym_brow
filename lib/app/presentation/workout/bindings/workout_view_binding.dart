import 'package:get/get.dart';
import 'package:gymbrow/app/data/datasources/deletes/delete_workout_datasource.dart';
import 'package:gymbrow/app/data/datasources/gets/get_workout_list_by_weekday_datasource.dart';
import 'package:gymbrow/app/data/datasources/local/deletes/delete_workout_local_datasource_imp.dart';
import 'package:gymbrow/app/data/datasources/local/gets/get_workout_list_by_weekday_local_datasource_imp.dart';
import 'package:gymbrow/app/data/datasources/local/saves/save_workout_local_datasource_imp.dart';
import 'package:gymbrow/app/data/datasources/local/updates/update_workout_local_datasource.dart';
import 'package:gymbrow/app/data/datasources/saves/save_workout_datasource.dart';
import 'package:gymbrow/app/data/datasources/updates/update_workout_datasource.dart';
import 'package:gymbrow/app/data/repositories/deletes/delete_workout_repository_imp.dart';
import 'package:gymbrow/app/data/repositories/gets/get_workout_list_by_weekday_repository_imp.dart';
import 'package:gymbrow/app/data/repositories/saves/save_workout_repository_imp.dart';
import 'package:gymbrow/app/data/repositories/updates/update_workout_repository_imp.dart';
import 'package:gymbrow/app/data/services/database/sqflite/get_database_sqlite_imp.dart';
import 'package:gymbrow/app/domain/repositories/deletes/delete_workout_repository.dart';
import 'package:gymbrow/app/domain/repositories/gets/get_workout_list_by_weekday_repository.dart';
import 'package:gymbrow/app/domain/repositories/saves/save_workout_repository.dart';
import 'package:gymbrow/app/domain/repositories/updates/update_workout_repository.dart';
import 'package:gymbrow/app/domain/usecases/deletes/delete_workout_usecase.dart';
import 'package:gymbrow/app/domain/usecases/deletes/delete_workout_usecase_imp.dart';
import 'package:gymbrow/app/domain/usecases/gets/get_workout_list_by_weekday_usecase.dart';
import 'package:gymbrow/app/domain/usecases/gets/get_workout_list_by_weekday_usecase_impl.dart';
import 'package:gymbrow/app/domain/usecases/saves/save_workout_usecase.dart';
import 'package:gymbrow/app/domain/usecases/saves/save_workout_usecase_imp.dart';
import 'package:gymbrow/app/domain/usecases/updates/update_workout_usecase.dart';
import 'package:gymbrow/app/domain/usecases/updates/update_workout_usecase_imp.dart';
import 'package:gymbrow/app/presentation/workout/controllers/workout_view_controller.dart';

class WorkoutViewBinding extends Bindings {
  @override
  void dependencies() {
    //controller
    Get.lazyPut<WorkoutViewController>(() => WorkoutViewController());

    //database
    Get.lazyPut<GetDatabaseSQLiteImp>(() => GetDatabaseSQLiteImp());

    //datasources
    Get.lazyPut<GetWorkoutListByWeekdayDatasource>(
      () => GetWorkoutListByWeekdayLocalDataSourceImp(Get.find()),
    );
    Get.lazyPut<DeleteWorkoutDatasource>(
      () => DeleteWorkoutLocalDatasourceImp(Get.find()),
    );
    Get.lazyPut<SaveWorkoutDatasource>(
      () => SaveWorkoutLocalDatasourceImp(Get.find()),
    );
    Get.lazyPut<UpdateWorkoutDatasource>(
      () => UpdateWorkoutLocalDatasourceImp(Get.find()),
    );

    //repositories
    Get.lazyPut<GetWorkoutByWeekdayRepository>(
      () => GetWorkoutByWeekdayRepositoryImp(Get.find()),
    );
    Get.lazyPut<DeleteWorkoutRepository>(
      () => DeleteWorkoutRepositoryImp(Get.find()),
    );
    Get.lazyPut<SaveWorkoutRepository>(
      () => SaveWorkoutRepositoryImp(Get.find()),
    );
    Get.lazyPut<UpdateWorkoutRepository>(
      () => UpdateWorkoutRepositoryImp(Get.find()),
    );

    //usecases
    Get.lazyPut<GetWorkoutListByWeekdayUseCase>(
      () => GetWorkoutListByWeekdayUseCaseImp(Get.find()),
    );
    Get.lazyPut<DeleteWorkoutUsecase>(
      () => DeleteWorkoutUsecaseImp(Get.find()),
    );
    Get.lazyPut<SaveWorkoutUsecase>(
      () => SaveWorkoutUsecaseImp(Get.find()),
    );
    Get.lazyPut<UpdateWorkoutUsecase>(
      () => UpdateWorkoutUsecaseImp(Get.find()),
    );
  }
}
