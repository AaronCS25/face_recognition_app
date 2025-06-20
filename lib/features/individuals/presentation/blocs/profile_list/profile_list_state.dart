part of 'profile_list_bloc.dart';

class ProfileListState {
  final bool isLoading;
  final bool isLastPage;
  final int offset;
  final int limit;
  final List<ProfilePreviewEntity> profiles;

  const ProfileListState({
    this.isLoading = false,
    this.isLastPage = false,
    this.offset = 0,
    this.limit = 10,
    this.profiles = const [],
  });

  ProfileListState copyWith({
    bool? isLoading,
    bool? isLastPage,
    int? offset,
    int? limit,
    List<ProfilePreviewEntity>? profiles,
  }) => ProfileListState(
    isLoading: isLoading ?? this.isLoading,
    isLastPage: isLastPage ?? this.isLastPage,
    offset: offset ?? this.offset,
    limit: limit ?? this.limit,
    profiles: profiles ?? this.profiles,
  );
}
