import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cvpr_face_recognition/features/history/history.dart';

part 'history_list_event.dart';
part 'history_list_state.dart';

class HistoryListBloc extends Bloc<HistoryListEvent, HistoryListState> {
  final Future<List<HistoryItemEntity>> Function([int offset, int limit])
  fetchHistory;

  HistoryListBloc({required this.fetchHistory})
    : super(const HistoryListState()) {
    on<FetchHistory>(_onLoadNextPage);

    add(const FetchHistory());
  }

  Future<void> _onLoadNextPage(
    FetchHistory event,
    Emitter<HistoryListState> emit,
  ) async {
    if (state.isLoading || state.isLastPage) return;
    emit(state.copyWith(isLoading: true));

    final newHistoryItems = await fetchHistory(state.offset, state.limit);

    if (newHistoryItems.isEmpty) {
      emit(state.copyWith(isLoading: false, isLastPage: true));
      return;
    }

    final updatedHistoryItems = List<HistoryItemEntity>.from(state.historyItems)
      ..addAll(newHistoryItems);

    emit(
      state.copyWith(
        isLoading: false,
        offset: state.offset + newHistoryItems.length,
        historyItems: updatedHistoryItems,
      ),
    );
  }
}
