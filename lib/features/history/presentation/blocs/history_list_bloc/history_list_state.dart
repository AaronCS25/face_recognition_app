part of 'history_list_bloc.dart';

class HistoryListState {
  final bool isLoading;
  final bool isLastPage;
  final int offset;
  final int limit;
  final List<HistoryItemEntity> historyItems;

  const HistoryListState({
    this.isLoading = false,
    this.isLastPage = false,
    this.offset = 0,
    this.limit = 10,
    this.historyItems = const [],
  });

  HistoryListState copyWith({
    bool? isLoading,
    bool? isLastPage,
    int? offset,
    int? limit,
    List<HistoryItemEntity>? historyItems,
  }) {
    return HistoryListState(
      isLoading: isLoading ?? this.isLoading,
      isLastPage: isLastPage ?? this.isLastPage,
      offset: offset ?? this.offset,
      limit: limit ?? this.limit,
      historyItems: historyItems ?? this.historyItems,
    );
  }
}
