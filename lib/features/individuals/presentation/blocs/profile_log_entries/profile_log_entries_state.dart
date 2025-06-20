part of 'profile_log_entries_bloc.dart';

class ProfileLogEntriesState {
  final bool isLoading;
  final bool isLastPage;
  final int offset;
  final int limit;
  final List<ProfileLogEntryEntity> logEntries;

  const ProfileLogEntriesState({
    this.isLoading = false,
    this.isLastPage = false,
    this.offset = 0,
    this.limit = 10,
    this.logEntries = const [],
  });

  ProfileLogEntriesState copyWith({
    bool? isLoading,
    bool? isLastPage,
    int? offset,
    int? limit,
    List<ProfileLogEntryEntity>? logEntries,
  }) => ProfileLogEntriesState(
    isLoading: isLoading ?? this.isLoading,
    isLastPage: isLastPage ?? this.isLastPage,
    offset: offset ?? this.offset,
    limit: limit ?? this.limit,
    logEntries: logEntries ?? this.logEntries,
  );
}
