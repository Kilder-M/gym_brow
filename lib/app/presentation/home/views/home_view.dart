import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gymbrow/app/domain/entities/workout_entity.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: FutureBuilder<List<WorkoutEntity>>(
          future: controller.listar(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              print(controller.workoutList.length);
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Obx(
                () => controller.workoutList.isNotEmpty
                    ? ListView.builder(
                        itemCount: controller.workoutList.length,
                        itemBuilder: (context, index) {
                          WorkoutEntity workoutEntity =
                              controller.workoutList[index];
                          return GestureDetector(
                            onTap: () {
                              print(controller.workoutList.length);
                            },
                            child: Container(
                              height: 200,
                              width: 100,
                              color: Colors.red,
                              child: Text(workoutEntity.name),
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: Text('lista vazia'),
                      ),
              );
            }
          },
        ));
  }
}
