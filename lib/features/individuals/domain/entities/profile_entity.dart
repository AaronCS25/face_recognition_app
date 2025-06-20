class ProfileEntity {
  final String id;
  final String name;
  final String imageUrl;
  final List<String> tags;
  final DateTime birthdate;
  final String gender;
  final int recognitionCount;
  final DateTime lastSeen;
  final String lastLocation;

  ProfileEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.tags,
    required this.birthdate,
    required this.gender,
    required this.recognitionCount,
    required this.lastSeen,
    required this.lastLocation,
  });
}
