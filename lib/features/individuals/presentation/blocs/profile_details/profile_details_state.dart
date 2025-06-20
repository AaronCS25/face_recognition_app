part of 'profile_details_bloc.dart';

class ProfileDetailsState {
  final String id;
  final bool isLoading;
  final ProfileEntity? profile;

  const ProfileDetailsState({
    required this.id,
    this.isLoading = false,
    this.profile,
  });

  ProfileDetailsState copyWith({
    String? id,
    bool? isLoading,
    ProfileEntity? profile,
  }) {
    return ProfileDetailsState(
      id: id ?? this.id,
      isLoading: isLoading ?? this.isLoading,
      profile: profile ?? this.profile,
    );
  }
}
