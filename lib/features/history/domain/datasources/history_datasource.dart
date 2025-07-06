import 'package:cvpr_face_recognition/features/history/history.dart';

abstract class HistoryDatasource {
  Future<List<HistoryItemEntity>> getHistoryItemsByPage([
    int offset = 0,
    int limit = 10,
  ]);
}
