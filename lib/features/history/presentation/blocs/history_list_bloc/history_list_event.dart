part of 'history_list_bloc.dart';

sealed class HistoryListEvent {
  const HistoryListEvent();
}

class FetchHistory extends HistoryListEvent {
  const FetchHistory();
}
