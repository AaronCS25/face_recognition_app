class ProfileLogEntryEntity {
  final DateTime timestamp;
  final double score;
  final String location;

  ProfileLogEntryEntity({
    required this.timestamp,
    required this.score,
    required this.location,
  });
}
