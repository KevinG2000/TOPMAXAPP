class Exercise {
  String id;
  String name;
  MeasurementType measurementType;
  
  Exercise({
    required this.id,
    required this.name,
    required this.measurementType,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'measurementType': measurementType.toString(),
  };

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
    id: json['id'],
    name: json['name'],
    measurementType: MeasurementType.values.firstWhere(
      (e) => e.toString() == json['measurementType'],
    ),
  );
}

enum MeasurementType {
  time,
  repetition,
  weight,
  weightAndRepetition,
  repetitionAndTime
}