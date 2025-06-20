import 'package:cvpr_face_recognition/features/individuals/individuals.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDatasource datasource;

  ProfileRepositoryImpl({required this.datasource});

  @override
  Future<ProfileEntity> getProfileById(String id) {
    return datasource.getProfileById(id);
  }

  @override
  Future<List<ProfileLogEntryEntity>> getProfileLogsById(
    String id, {
    int offset = 0,
    int limit = 10,
  }) {
    return datasource.getProfileLogsById(id, offset: offset, limit: limit);
  }

  @override
  Future<List<ProfilePreviewEntity>> getProfilesByPage({
    int offset = 0,
    int limit = 10,
  }) {
    return datasource.getProfilesByPage(offset: offset, limit: limit);
  }
}
