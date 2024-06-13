import 'package:get/get.dart';
import 'package:gymbrow/app/data/datasources/local/saves/save_workout_local_datasource_imp.dart';
import 'package:gymbrow/app/data/datasources/local/updates/update_workout_local_datasource.dart';
import 'package:gymbrow/app/data/datasources/saves/save_workout_datasource.dart';
import 'package:gymbrow/app/data/datasources/updates/update_workout_datasource.dart';
import 'package:gymbrow/app/data/repositories/saves/save_workout_repository_imp.dart';
import 'package:gymbrow/app/data/repositories/updates/update_workout_repository_imp.dart';
import 'package:gymbrow/app/domain/repositories/saves/save_workout_repository.dart';
import 'package:gymbrow/app/domain/repositories/updates/update_workout_repository.dart';
import 'package:gymbrow/app/domain/usecases/saves/save_workout_usecase.dart';
import 'package:gymbrow/app/domain/usecases/saves/save_workout_usecase_imp.dart';
import 'package:gymbrow/app/domain/usecases/updates/update_workout_usecase.dart';
import 'package:gymbrow/app/domain/usecases/updates/update_workout_usecase_imp.dart';
import 'package:gymbrow/app/presentation/workout/controllers/workout_form_view_controller.dart';

class WorkoutFormViewBinding extends Bindings {
  @override
  void dependencies() {
    //controller
    Get.lazyPut<WorkoutFormViewController>(() => WorkoutFormViewController());
    Get.lazyPut<WorkoutFormViewController>(() => WorkoutFormViewController());

    //DataSources
    Get.lazyPut<SaveWorkoutDatasource>(
      () => SaveWorkoutLocalDatasourceImp(Get.find()),
    );
    Get.lazyPut<UpdateWorkoutDatasource>(
      () => UpdateWorkoutLocalDatasourceImp(Get.find()),
    );

    //Repositories
    Get.lazyPut<SaveWorkoutRepository>(
      () => SaveWorkoutRepositoryImp(Get.find()),
    );
    Get.lazyPut<UpdateWorkoutRepository>(
      () => UpdateWorkoutRepositoryImp(Get.find()),
    );

    //Usecases
    Get.lazyPut<SaveWorkoutUsecase>(
      () => SaveWorkoutUsecaseImp(Get.find()),
    );
    Get.lazyPut<UpdateWorkoutUsecase>(
      () => UpdateWorkoutUsecaseImp(Get.find()),
    );
  }
}
