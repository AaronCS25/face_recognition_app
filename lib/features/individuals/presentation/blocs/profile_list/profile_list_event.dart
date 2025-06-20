part of 'profile_list_bloc.dart';

sealed class ProfileListEvent {
  const ProfileListEvent();
}

class FetchProfiles extends ProfileListEvent {}
