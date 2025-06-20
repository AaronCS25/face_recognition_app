import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cvpr_face_recognition/features/individuals/individuals.dart';

part 'profile_list_event.dart';
part 'profile_list_state.dart';

class ProfileListBloc extends Bloc<ProfileListEvent, ProfileListState> {
  final Future<List<ProfilePreviewEntity>> Function({int offset, int limit})
  fetchProfiles;

  ProfileListBloc({required this.fetchProfiles})
    : super(const ProfileListState()) {
    on<FetchProfiles>(_onLoadNextPage);

    add(FetchProfiles());
  }

  Future<void> _onLoadNextPage(
    FetchProfiles event,
    Emitter<ProfileListState> emit,
  ) async {
    if (state.isLoading || state.isLastPage) return;
    emit(state.copyWith(isLoading: true));

    final newProfiles = await fetchProfiles(
      offset: state.offset,
      limit: state.limit,
    );

    if (newProfiles.isEmpty) {
      emit(state.copyWith(isLoading: false, isLastPage: true));
      return;
    }

    final updatedProfiles = List<ProfilePreviewEntity>.from(state.profiles)
      ..addAll(newProfiles);

    emit(
      state.copyWith(
        isLoading: false,
        offset: state.offset + newProfiles.length,
        profiles: updatedProfiles,
      ),
    );
  }
}
