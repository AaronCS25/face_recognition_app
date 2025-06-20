import 'package:cvpr_face_recognition/database/database.dart';
import 'package:cvpr_face_recognition/features/individuals/individuals.dart';

class LocalProfileDatasourceImpl implements ProfileDatasource {
  @override
  Future<ProfileEntity> getProfileById(String id) async {
    await Future.delayed(const Duration(seconds: 1));

    final jsonProfile = jsonProfiles.firstWhere(
      (profile) => profile["id"] == id,
      orElse: () => throw Exception('Profile not found'),
    );

    return LocalProfileMapper.profileModelToEntity(
      LocalProfileModel.fromJson(jsonProfile),
    );
  }

  @override
  Future<List<ProfileLogEntryEntity>> getProfileLogsById(
    String id, {
    int offset = 0,
    int limit = 10,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    final jsonProfile = jsonProfiles.firstWhere(
      (profile) => profile["id"] == id,
      orElse: () => throw Exception('Profile not found'),
    );

    final logs = (jsonProfile['recognition_history'] as List)
        .map(
          (log) => LocalProfileMapper.profileLogEntryModelToEntity(
            LocalProfileLogEntryModel.fromJson(log),
          ),
        )
        .toList();

    return logs.skip(offset).take(limit).toList();
  }

  @override
  Future<List<ProfilePreviewEntity>> getProfilesByPage({
    int offset = 0,
    int limit = 10,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    final profiles = jsonProfilesPreview
        .map(
          (profile) => LocalProfileMapper.profilePreviewModelToEntity(
            LocalProfilePreviewModel.fromJson(profile),
          ),
        )
        .toList();

    return profiles.skip(offset).take(limit).toList();
  }
}
