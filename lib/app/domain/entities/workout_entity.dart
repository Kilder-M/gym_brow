class WorkoutEntity {
  int? id;
  String name;
  int reps;
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
    required this.reps,
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
    reps: $reps 
    sets: $sets 
    resttime: $restTime 
    weigth: $weight 
    isDone: $isDone 
    imageUrl: $imageUrl 
    observations: $observations 
    weekDay: $weekDay''';
  }
}
