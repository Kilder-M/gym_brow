import 'package:get/get.dart';
import 'package:gymbrow/app/presentation/home/bindings/home_binding.dart';
import 'package:gymbrow/app/presentation/home/views/home_view.dart';
import 'package:gymbrow/app/presentation/workout/bindings/workout_form_view_binding.dart';
import 'package:gymbrow/app/presentation/workout/bindings/workout_view_binding.dart';
import 'package:gymbrow/app/presentation/workout/views/workout_form_view.dart';
import 'package:gymbrow/app/presentation/workout/views/workout_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.workoutView,
      page: () => const WorkoutView(),
      binding: WorkoutViewBinding(),
    ),
    GetPage(
      name: _Paths.workoutForm,
      page: () => const WorkoutFormView(),
      binding: WorkoutFormViewBinding(),
    ),
  ];
}
