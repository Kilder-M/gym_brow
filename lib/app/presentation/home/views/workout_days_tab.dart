import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymbrow/app/core/utils/models/weekday_dart';

class WorkoutDaysTab extends StatelessWidget {
  const WorkoutDaysTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<Weekday> weekdays = [
      Weekday(id: 2, nome: 'Segunda'),
      Weekday(id: 3, nome: 'Terça'),
      Weekday(id: 4, nome: 'Quarta'),
      Weekday(id: 5, nome: 'Quinta'),
      Weekday(id: 6, nome: 'Sexta'),
      Weekday(id: 7, nome: 'Sábado'),
      Weekday(id: 1, nome: 'Domingo'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gymbrow'),
      ),
      body: ListView.builder(
        itemCount: weekdays.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.fitness_center_rounded),
              ),
              title: Text(weekdays[index].nome),
              onTap: () {
                Get.toNamed('workout_view', arguments: weekdays[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
