part of 'profile_details_bloc.dart';

sealed class ProfileDetailsEvent {
  const ProfileDetailsEvent();
}

class FetchProfileDetails extends ProfileDetailsEvent {}
