class HistoryItemEntity {
  final String imageUrl;
  final String id;
  final String name;
  final double score;
  final DateTime timestamp;
  final String location;
  final DateTime birthdate;
  final String gender;
  final String notes;

  HistoryItemEntity({
    required this.imageUrl,
    required this.id,
    required this.name,
    required this.score,
    required this.timestamp,
    required this.location,
    required this.birthdate,
    required this.gender,
    required this.notes,
  });
}
