import 'package:cvpr_face_recognition/features/individuals/individuals.dart';

class LocalProfileMapper {
  static ProfilePreviewEntity profilePreviewModelToEntity(
    LocalProfilePreviewModel model,
  ) => ProfilePreviewEntity(
    id: model.id,
    name: model.name,
    imageUrl: model.imageUrl,
    lastSeen: model.lastSeen,
    recognitionCount: model.recognitionCount,
    tags: model.tags,
  );

  static ProfileEntity profileModelToEntity(LocalProfileModel model) =>
      ProfileEntity(
        id: model.id,
        name: model.name,
        imageUrl: model.imageUrl,
        tags: model.tags,
        birthdate: model.birthday,
        gender: model.gender,
        recognitionCount: model.recognitionCount,
        lastSeen: model.lastSeen,
        lastLocation: model.lastLocation,
      );

  static ProfileLogEntryEntity profileLogEntryModelToEntity(
    LocalProfileLogEntryModel model,
  ) => ProfileLogEntryEntity(
    timestamp: model.datetime,
    score: model.score,
    location: model.location,
  );
}
