import 'package:cvpr_face_recognition/features/history/history.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryDatasource datasource;

  HistoryRepositoryImpl(this.datasource);

  @override
  Future<List<HistoryItemEntity>> getHistoryItemsByPage([
    int offset = 0,
    int limit = 10,
  ]) {
    return datasource.getHistoryItemsByPage(offset, limit);
  }
}
