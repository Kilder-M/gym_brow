import 'package:get/get.dart';
import 'package:gymbrow/app/data/datasources/local/saves/save_workout_local_datasource_imp.dart';
import 'package:gymbrow/app/data/datasources/saves/save_workout_datasource.dart';
import 'package:gymbrow/app/data/repositories/saves/save_workout_repository_imp.dart';
import 'package:gymbrow/app/domain/repositories/saves/save_workout_repository.dart';
import 'package:gymbrow/app/domain/usecases/saves/save_workout_usecase.dart';
import 'package:gymbrow/app/domain/usecases/saves/save_workout_usecase_imp.dart';
import 'package:gymbrow/app/presentation/workout/controllers/workout_form_view_controller.dart';

class WorkoutFormViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkoutFormViewController>(() => WorkoutFormViewController());


    //DataSources
    Get.lazyPut<SaveWorkoutDatasource>(
      () => SaveWorkoutLocalDatasourceImp(Get.find()),
    );

    //Repositories
    Get.lazyPut<SaveWorkoutRepository>(
      () => SaveWorkoutRepositoryImp(Get.find()),
    );

    //Usecases
    Get.lazyPut<SaveWorkoutUsecase>(
      () => SaveWorkoutUsecaseImp(Get.find()),
    );
    Get.lazyPut<WorkoutFormViewController>(() => WorkoutFormViewController());
  }
}
