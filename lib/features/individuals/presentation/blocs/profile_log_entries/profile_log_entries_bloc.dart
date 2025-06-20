import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cvpr_face_recognition/features/individuals/individuals.dart';

part 'profile_log_entries_event.dart';
part 'profile_log_entries_state.dart';

class ProfileLogEntriesBloc
    extends Bloc<ProfileLogEntriesEvent, ProfileLogEntriesState> {
  final String id;
  final Future<List<ProfileLogEntryEntity>> Function(
    String id, {
    int offset,
    int limit,
  })
  fetchProfileLogEntries;

  ProfileLogEntriesBloc({
    required this.id,
    required this.fetchProfileLogEntries,
  }) : super(const ProfileLogEntriesState()) {
    on<FetchProfileLogEntries>(_onFetchProfileLogEntries);

    add(FetchProfileLogEntries());
  }

  Future<void> _onFetchProfileLogEntries(
    FetchProfileLogEntries event,
    Emitter<ProfileLogEntriesState> emit,
  ) async {
    if (state.isLoading || state.isLastPage) return;
    emit(state.copyWith(isLoading: true));

    final newLogEntries = await fetchProfileLogEntries(
      id,
      offset: state.offset,
      limit: state.limit,
    );

    if (newLogEntries.isEmpty) {
      emit(state.copyWith(isLoading: false, isLastPage: true));
      return;
    }

    final updatedLogEntries = List<ProfileLogEntryEntity>.from(state.logEntries)
      ..addAll(newLogEntries);

    emit(
      state.copyWith(
        isLoading: false,
        offset: state.offset + newLogEntries.length,
        logEntries: updatedLogEntries,
      ),
    );
  }
}
