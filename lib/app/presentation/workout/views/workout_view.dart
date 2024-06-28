import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymbrow/app/domain/entities/workout_entity.dart';
import 'package:gymbrow/app/presentation/bases/gb_base_view.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:gymbrow/app/presentation/workout/controllers/workout_view_controller.dart';

class WorkoutView extends GBBaseView<WorkoutViewController> {
  const WorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(
            '/workout_form',
            arguments: [
              controller.weekday,
              WorkoutEntity(
                weight: 0.0,
                name: '',
                series: 0,
                repetitions: 0,
                restTime: 0.0,
                isDone: false,
                weekDay: DateTime.now().day,
              ),
            ],
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(controller.weekday.nome),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FutureBuilder(
          future: controller.listWorkouts(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Obx(
                () => ListView.builder(
                  itemCount: controller.workoutList.length,
                  itemBuilder: (context, index) {
                    WorkoutEntity workoutEntity = controller.workoutList[index];
                    RxBool isDone = workoutEntity.isDone.obs;
                    return Card(
                      child: ListTile(
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Expanded(
                                  child: Tooltip(
                                    message: workoutEntity.name,
                                    child: Text(
                                      workoutEntity.name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      controller.deleteWorkout(workoutEntity);
                                      Get.back();
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)!.delete,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                      Get.toNamed('/workout_form', arguments: [
                                        controller.weekday,
                                        workoutEntity,
                                      ]);
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)!.edit,
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  workoutEntity.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.textTheme.titleMedium,
                                ),
                                actions: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${AppLocalizations.of(context)!.workout}:',
                                          style: context.textTheme.titleSmall,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: IconLabelValue(
                                                icon: Icons.repeat,
                                                value:
                                                    '${workoutEntity.series} x ${workoutEntity.repetitions}',
                                              ),
                                            ),
                                            Expanded(
                                              child: IconLabelValue(
                                                icon: Icons.timer_outlined,
                                                value:
                                                    '${workoutEntity.restTime.toString()}min',
                                              ),
                                            ),
                                            Expanded(
                                              child: IconLabelValue(
                                                icon: Icons.fitness_center,
                                                value:
                                                    '${workoutEntity.weight}kg',
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        )
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${AppLocalizations.of(context)!.observations}:',
                                        style: context.textTheme.titleSmall,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 8, 0, 8),
                                        width: double.infinity,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.25,
                                        decoration: BoxDecoration(
                                          color: context.theme.colorScheme
                                              .secondaryContainer,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 6,
                                            workoutEntity.observations ?? '',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        title: Row(
                          children: [
                            Expanded(
                              child: Tooltip(
                                message: workoutEntity.name,
                                child: Text(
                                  workoutEntity.name,
                                  maxLines: 2,
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
                                icon: Icons.repeat,
                                value:
                                    '${workoutEntity.series} x ${workoutEntity.repetitions}',
                              ),
                            ),
                            Expanded(
                              child: IconLabelValue(
                                icon: Icons.timer_outlined,
                                value:
                                    '${workoutEntity.restTime.toString()}min',
                              ),
                            ),
                            Expanded(
                              child: IconLabelValue(
                                icon: Icons.fitness_center,
                                value: '${workoutEntity.weight}kg',
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
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
  final String? tooltipMessage;

  const IconLabelValue({
    super.key,
    required this.icon,
    required this.value,
    this.tooltipMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltipMessage ?? '',
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
