import 'package:cvpr_face_recognition/config/config.dart';
import 'package:cvpr_face_recognition/features/history/presentation/blocs/history_list_bloc/history_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cvpr_face_recognition/features/history/history.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.history_outlined, size: 20),
            const SizedBox(width: 8),
            Text(
              "Recognition History",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => HistoryListBloc(
          fetchHistory:
              ServiceLocator.get<HistoryRepository>().getHistoryItemsByPage,
        ),
        child: const _HistoryViewBody(),
      ),
    );
  }
}

class _HistoryViewBody extends StatefulWidget {
  const _HistoryViewBody();

  @override
  State<_HistoryViewBody> createState() => _HistoryViewBodyState();
}

class _HistoryViewBodyState extends State<_HistoryViewBody> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        context.read<HistoryListBloc>().add(const FetchHistory());
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final historyItems = context.watch<HistoryListBloc>().state.historyItems;

    return ListView.separated(
      controller: _scrollController,
      padding: const EdgeInsets.all(8.0),
      cacheExtent: 1200,
      itemCount: historyItems.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8.0),
      itemBuilder: (context, index) =>
          RecognitionHistoryItemWidget(historyItem: historyItems[index]),
    );
  }
}
