import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cvpr_face_recognition/config/config.dart';
import 'package:cvpr_face_recognition/features/individuals/individuals.dart';

class IndividualsView extends StatelessWidget {
  const IndividualsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.people_alt_outlined, size: 20),
            const SizedBox(width: 8),
            Text("Unique Individuals", style: theme.textTheme.headlineLarge),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => ProfileListBloc(
          fetchProfiles:
              ServiceLocator.get<ProfileRepositoryImpl>().getProfilesByPage,
        ),
        child: const _IndividualsViewBody(),
      ),
    );
  }
}

class _IndividualsViewBody extends StatefulWidget {
  const _IndividualsViewBody();

  @override
  State<_IndividualsViewBody> createState() => _IndividualsViewBodyState();
}

class _IndividualsViewBodyState extends State<_IndividualsViewBody> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        context.read<ProfileListBloc>().add(FetchProfiles());
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
    final profiles = context.watch<ProfileListBloc>().state.profiles;

    return ListView.separated(
      controller: _scrollController,
      padding: const EdgeInsets.all(8.0),
      cacheExtent: 800,
      itemCount: profiles.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8.0),
      itemBuilder: (context, index) =>
          ProfilePreviewCard(profilePreview: profiles[index]),
    );
  }
}
