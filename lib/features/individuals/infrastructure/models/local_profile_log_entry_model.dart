class LocalProfileLogEntryModel {
  final DateTime datetime;
  final String location;
  final double score;

  LocalProfileLogEntryModel({
    required this.datetime,
    required this.location,
    required this.score,
  });

  factory LocalProfileLogEntryModel.fromJson(Map<String, dynamic> json) =>
      LocalProfileLogEntryModel(
        datetime: DateTime.parse(json["datetime"]),
        location: json["location"],
        score: json["score"],
      );
}
