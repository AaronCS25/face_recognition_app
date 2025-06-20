class ProfilePreviewEntity {
  final String id;
  final String name;
  final String imageUrl;
  final DateTime lastSeen;
  final int recognitionCount;
  final List<String> tags;

  ProfilePreviewEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.lastSeen,
    required this.recognitionCount,
    required this.tags,
  });
}
