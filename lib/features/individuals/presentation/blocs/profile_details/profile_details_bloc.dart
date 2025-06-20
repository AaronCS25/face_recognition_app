import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cvpr_face_recognition/features/individuals/individuals.dart';

part 'profile_details_event.dart';
part 'profile_details_state.dart';

class ProfileDetailsBloc
    extends Bloc<ProfileDetailsEvent, ProfileDetailsState> {
  final String id;
  final Future<ProfileEntity> Function(String id) fetchProfileDetails;

  ProfileDetailsBloc({required this.id, required this.fetchProfileDetails})
    : super(ProfileDetailsState(id: id)) {
    on<FetchProfileDetails>(_onFetchProfileDetails);
    add(FetchProfileDetails());
  }

  Future<void> _onFetchProfileDetails(
    FetchProfileDetails event,
    Emitter<ProfileDetailsState> emit,
  ) async {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true));

    final profile = await fetchProfileDetails(id);

    emit(state.copyWith(isLoading: false, profile: profile));
  }
}
