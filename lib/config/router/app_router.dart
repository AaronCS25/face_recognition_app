import 'package:cvpr_face_recognition/features/individuals/presentation/views/individuals_details_view.dart';
import 'package:go_router/go_router.dart';
import 'package:cvpr_face_recognition/features/shared/shared.dart';
import 'package:cvpr_face_recognition/features/history/presentation/views/history_view.dart';
import 'package:cvpr_face_recognition/features/settings/presentation/views/settings_view.dart';
import 'package:cvpr_face_recognition/features/live_feed/presentation/views/live_feed_view.dart';
import 'package:cvpr_face_recognition/features/individuals/presentation/views/individuals_view.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          RootScreen(navigationShell: navigationShell),
      branches: [
        // -- BOTTOM NAVIGATION BAR BRANCHES --
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const LiveFeedView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/history',
              builder: (context, state) => const HistoryView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/individuals',
              builder: (context, state) => const IndividualsView(),
              routes: [
                GoRoute(
                  path: '/:id',
                  builder: (context, state) {
                    final id = state.pathParameters['id']!;
                    return IndividualsDetailsView(id: id);
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              builder: (context, state) => const SettingsView(),
            ),
          ],
        ),
      ],
    ),
  ],
);
