import 'package:get/get.dart';
import 'package:gymbrow/app/presentation/workout/controllers/workout_form_view_controller.dart';

class WorkoutFormViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkoutFormViewController>(() => WorkoutFormViewController());
  }
}
