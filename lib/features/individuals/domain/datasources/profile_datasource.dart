import 'package:cvpr_face_recognition/features/individuals/individuals.dart';

abstract class ProfileDatasource {
  Future<ProfileEntity> getProfileById(String id);

  Future<List<ProfileLogEntryEntity>> getProfileLogsById(
    String id, {
    int offset = 0,
    int limit = 10,
  });

  Future<List<ProfilePreviewEntity>> getProfilesByPage({
    int offset = 0,
    int limit = 10,
  });
}
