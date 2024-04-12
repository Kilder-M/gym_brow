class WorkoutEntity {
  int id;
  String name;
  int series;
  int repetitions;
  double restTime;
  double weight;
  bool isDone;
  String imageUrl;
  int weekDay;

  WorkoutEntity({
    required this.id,
    required this.weight,
    required this.name,
    required this.series,
    required this.repetitions,
    required this.restTime,
    required this.isDone,
    required this.imageUrl,
    required this.weekDay,
  });
}
