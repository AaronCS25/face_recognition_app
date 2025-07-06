class HistoryItemModel {
  final String imageUrl;
  final String id;
  final String name;
  final double confidence;
  final DateTime timestamp;
  final String location;
  final int age;
  final DateTime dob;
  final String gender;
  final String notes;

  HistoryItemModel({
    required this.imageUrl,
    required this.id,
    required this.name,
    required this.confidence,
    required this.timestamp,
    required this.location,
    required this.age,
    required this.dob,
    required this.gender,
    required this.notes,
  });

  factory HistoryItemModel.fromJson(Map<String, dynamic> json) =>
      HistoryItemModel(
        imageUrl: json["imageUrl"],
        id: json["id"],
        name: json["name"],
        confidence: double.parse(json["confidence"].toString()),
        timestamp: DateTime.parse(json["timestamp"]),
        location: json["location"],
        age: json["age"],
        dob: DateTime.parse(json["dob"]),
        gender: json["gender"],
        notes: json["notes"],
      );
}
