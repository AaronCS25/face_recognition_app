import 'package:cvpr_face_recognition/database/database.dart';
import 'package:cvpr_face_recognition/features/history/history.dart';

class LocalHistoryDatasourceImpl implements HistoryDatasource {
  @override
  Future<List<HistoryItemEntity>> getHistoryItemsByPage([
    int offset = 0,
    int limit = 10,
  ]) async {
    await Future.delayed(const Duration(seconds: 1));

    final historyItems = jsonRecognitionHistory
        .map(
          (item) => HistoryMapper.historyModelToEntity(
            HistoryItemModel.fromJson(item),
          ),
        )
        .toList();

    return historyItems.skip(offset).take(limit).toList();
  }
}
