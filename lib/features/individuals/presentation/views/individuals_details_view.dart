import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cvpr_face_recognition/config/config.dart';
import 'package:cvpr_face_recognition/features/individuals/individuals.dart';

class IndividualsDetailsView extends StatelessWidget {
  final String id;

  const IndividualsDetailsView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Person Details")),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<ProfileDetailsBloc>(
            create: (context) => ProfileDetailsBloc(
              id: id,
              fetchProfileDetails:
                  ServiceLocator.get<ProfileRepositoryImpl>().getProfileById,
            ),
          ),
          BlocProvider<ProfileLogEntriesBloc>(
            create: (context) => ProfileLogEntriesBloc(
              id: id,
              fetchProfileLogEntries:
                  ServiceLocator.get<ProfileRepositoryImpl>()
                      .getProfileLogsById,
            ),
          ),
        ],
        child: const _IndividualsDetailsViewBody(),
      ),
    );
  }
}

class _IndividualsDetailsViewBody extends StatefulWidget {
  const _IndividualsDetailsViewBody();

  @override
  State<_IndividualsDetailsViewBody> createState() =>
      _IndividualsDetailsViewBodyState();
}

class _IndividualsDetailsViewBodyState
    extends State<_IndividualsDetailsViewBody> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        context.read<ProfileLogEntriesBloc>().add(FetchProfileLogEntries());
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
    final theme = Theme.of(context);
    final profile = context.watch<ProfileDetailsBloc>().state.profile;
    final profileLogs = context.watch<ProfileLogEntriesBloc>().state.logEntries;

    if (profile == null || profileLogs.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 48,
                  backgroundImage: null,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: profile.imageUrl,
                      width: 96,
                      height: 96,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(strokeWidth: 2),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(profile.name, style: theme.textTheme.headlineLarge),
                const SizedBox(height: 4),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    CustomTag(
                      label: "ID: ${profile.id}",
                      type: TagType.secondary,
                    ),
                    ...profile.tags.map(
                      (tag) => CustomTag(label: tag, type: TagType.primary),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: _DetailInfo(
                                label: "Age",
                                value:
                                    "${HumanFormats.calculateAge(profile.birthdate)} years",
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _DetailInfo(
                                label: "Gender",
                                value: profile.gender,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: _DetailInfo(
                                label: "Date of Birth",
                                value: HumanFormats.formatDate(
                                  profile.birthdate,
                                  format: "MMMM dd, yyyy",
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _DetailInfo(
                                label: "Recognition Count",
                                value: "${profile.recognitionCount}",
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: _DetailInfo(
                            label: "Last Seen",
                            value: HumanFormats.formatDate(
                              profile.lastSeen,
                              format: "MM/dd/yyyy, h:mm:ss",
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: _DetailInfo(
                            label: "Last Location",
                            value: profile.lastLocation,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Recognition History",
                    style: theme.textTheme.headlineLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(
            left: 16.0,
            top: 12.0,
            right: 16.0,
            bottom: 24.0,
          ),
          sliver: SliverList.separated(
            itemCount: profileLogs.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) =>
                LogEntryCard(logEntry: profileLogs[index]),
          ),
        ),
      ],
    );
  }
}

class _DetailInfo extends StatelessWidget {
  final String label;
  final String value;

  const _DetailInfo({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14)),
        const SizedBox(height: 4),
        Text(value, style: theme.textTheme.bodyLarge),
      ],
    );
  }
}
