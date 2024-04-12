import 'package:gymbrow/app/domain/entities/workout_entity.dart';

class WorkoutDTO extends WorkoutEntity {
  WorkoutDTO({
    required super.id,
    required super.weight,
    required super.name,
    required super.series,
    required super.repetitions,
    required super.restTime,
    required super.isDone,
    required super.imageUrl,
    required super.weekDay,
  });

  factory WorkoutDTO.fromMapLocalDataBase(Map<String, dynamic> json) {
    return WorkoutDTO(
      id: json['id'] as int,
      weight: json['weight'] as double,
      name: json['name'] as String,
      series: json['series'] as int,
      repetitions: json['repetitions'] as int,
      restTime: json['rest_time'] as double,
      isDone: json['is_done'] == 0 ? false : true,
      imageUrl: json['image_url'] as String,
      weekDay: json['weekday'] as int,
    );
  }

  Map<String, dynamic> toJsonLocalDataBase() {
    return {
      'id': id,
      'weight': weight,
      'name': name,
      'series': series,
      'repetitions': repetitions,
      'restTime': restTime,
      'isDone': isDone,
      'imageUrl': imageUrl,
      'weekDay': weekDay,
    };
  }
}
