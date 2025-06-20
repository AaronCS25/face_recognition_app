class LocalProfileModel {
  final String id;
  final String name;
  final String imageUrl;
  final List<String> tags;
  final String gender;
  final DateTime birthday;
  final int recognitionCount;
  final DateTime lastSeen;
  final String lastLocation;

  LocalProfileModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.tags,
    required this.gender,
    required this.birthday,
    required this.recognitionCount,
    required this.lastSeen,
    required this.lastLocation,
  });

  factory LocalProfileModel.fromJson(Map<String, dynamic> json) =>
      LocalProfileModel(
        id: json["id"],
        name: json["name"],
        imageUrl: json["imageUrl"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        gender: json["gender"],
        birthday: DateTime.parse(json["birthday"]),
        recognitionCount: json["recognitionCount"],
        lastSeen: DateTime.parse(json["lastSeen"]),
        lastLocation: json["last_location"],
      );
}
