import 'package:cvpr_face_recognition/features/history/history.dart';

class HistoryMapper {
  static HistoryItemEntity historyModelToEntity(HistoryItemModel model) =>
      HistoryItemEntity(
        imageUrl: model.imageUrl,
        id: model.id,
        name: model.name,
        score: model.confidence,
        timestamp: model.timestamp,
        location: model.location,
        birthdate: model.dob,
        gender: model.gender,
        notes: model.notes,
      );
}
