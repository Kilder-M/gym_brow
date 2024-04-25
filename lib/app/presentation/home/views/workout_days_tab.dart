import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:gymbrow/app/core/utils/models/weekday_dart';

class WorkoutDaysTab extends StatelessWidget {
  const WorkoutDaysTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<Weekday> weekdays = [
      Weekday(id: 2, nome: AppLocalizations.of(context)!.monday),
      Weekday(id: 3, nome: AppLocalizations.of(context)!.tuesday),
      Weekday(id: 4, nome: AppLocalizations.of(context)!.wednesday),
      Weekday(id: 5, nome: AppLocalizations.of(context)!.thurday),
      Weekday(id: 6, nome: AppLocalizations.of(context)!.friday),
      Weekday(id: 7, nome: AppLocalizations.of(context)!.saturday),
      Weekday(id: 1, nome: AppLocalizations.of(context)!.sunday),
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
