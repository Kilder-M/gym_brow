import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:get/get.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FutureBuilder(
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
                  RxBool isDone = workoutEntity.isDone.obs;
                  return Card(
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      title: Row(
                        children: [
                          Expanded(
                            child: Tooltip(
                              message: workoutEntity.name,
                              child: Text(
                                workoutEntity.name,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Obx(
                                () => SizedBox(
                                  width: 50,
                                  height: 30,
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Switch(
                                      value: isDone.value,
                                      onChanged: (bool value) {
                                        isDone.value = value;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      leading: const CircleAvatar(
                        child: Icon(
                          Icons.fitness_center_outlined,
                          size: 12,
                        ),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: IconLabelValue(
                              tooltipMessage: '',
                              icon: Icons.repeat,
                              value:
                                  '${workoutEntity.series} x ${workoutEntity.repetitions}',
                            ),
                          ),
                          Expanded(
                            child: IconLabelValue(
                              tooltipMessage: '',
                              icon: Icons.timer_outlined,
                              value: '${workoutEntity.restTime.toString()}min',
                            ),
                          ),
                          Expanded(
                            child: IconLabelValue(
                              tooltipMessage: '',
                              icon: Icons.fitness_center,
                              value: '${workoutEntity.weight}kg',
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class IconLabelValue extends StatelessWidget {
  final IconData icon;
  final String value;
  final String tooltipMessage;

  const IconLabelValue(
      {super.key,
      required this.icon,
      required this.value,
      required this.tooltipMessage});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltipMessage,
      child: Row(
        children: [
          Icon(
            icon,
            size: 14,
          ),
          const SizedBox(
            width: 2,
          ),
          Expanded(
            child: Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
