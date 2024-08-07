class WorkoutEntity {
  int? id;
  String name;
  int series;
  int sets;
  double? restTime;
  double? weight;
  bool isDone;
  String? imageUrl;
  String? observations;
  int weekDay;

  WorkoutEntity({
    this.id,
    this.weight,
    this.observations,
    required this.name,
    required this.series,
    required this.sets,
    this.restTime,
    this.isDone = false,
    this.imageUrl,
    required this.weekDay,
  });

  @override
  String toString() {
    return '''
    id: $id 
    name: $name 
    series: $series 
    sets: $sets 
    resttime: $restTime 
    weigth: $weight 
    isDone: $isDone 
    imageUrl: $imageUrl 
    observations: $observations 
    weekDay: $weekDay''';
  }
}
