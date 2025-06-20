part of 'profile_log_entries_bloc.dart';

sealed class ProfileLogEntriesEvent {
  const ProfileLogEntriesEvent();
}

class FetchProfileLogEntries extends ProfileLogEntriesEvent {}
