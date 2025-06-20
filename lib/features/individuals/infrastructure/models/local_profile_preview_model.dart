class LocalProfilePreviewModel {
  final String id;
  final String name;
  final String imageUrl;
  final DateTime lastSeen;
  final int recognitionCount;
  final List<String> tags;

  LocalProfilePreviewModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.lastSeen,
    required this.recognitionCount,
    required this.tags,
  });

  factory LocalProfilePreviewModel.fromJson(Map<String, dynamic> json) =>
      LocalProfilePreviewModel(
        id: json["id"],
        name: json["name"],
        imageUrl: json["imageUrl"],
        lastSeen: DateTime.parse(json["lastSeen"]),
        recognitionCount: json["recognitionCount"],
        tags: List<String>.from(json["tags"].map((x) => x)),
      );
}
