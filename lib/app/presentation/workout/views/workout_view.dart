import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:gymbrow/app/domain/entities/workout_entity.dart';
import 'package:gymbrow/app/presentation/bases/gb_base_view.dart';
import 'package:gymbrow/app/presentation/workout/controllers/workout_view_controller.dart';

class WorkoutView extends GBBaseView<WorkoutViewController> {
  const WorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.weekday.nome),
      ),
      body: FutureBuilder(
        future: controller.listar(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: controller.workoutList.length,
              itemBuilder: (context, index) {
                WorkoutEntity workoutEntity = controller.workoutList[index];
                return ListTile(
                  title: Text(workoutEntity.name),
                );
              },
            );
          }
        },
      ),
    );
  }
}
