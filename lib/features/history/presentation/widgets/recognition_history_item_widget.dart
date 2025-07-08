import 'package:cvpr_face_recognition/config/helpers/human_formats.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cvpr_face_recognition/features/shared/shared.dart';
import 'package:cvpr_face_recognition/features/history/history.dart';

class RecognitionHistoryItemWidget extends StatelessWidget {
  final HistoryItemEntity historyItem;

  const RecognitionHistoryItemWidget({super.key, required this.historyItem});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final spanTheme = theme.textTheme.bodyMedium;
    final contentTheme = theme.textTheme.bodyMedium?.copyWith(
      color: theme.colorScheme.onSecondary,
    );

    return Card(
      clipBehavior: Clip.hardEdge,
      child: Theme(
        data: theme.copyWith(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
        ),
        child: ExpansionTile(
          iconColor: Colors.white,
          collapsedIconColor: Colors.white,
          expansionAnimationStyle: const AnimationStyle(
            duration: Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
          ),
          tilePadding: const EdgeInsets.all(12.0),
          leading: CircleAvatar(
            radius: 28,
            backgroundImage: null,
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: historyItem.imageUrl,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(strokeWidth: 2),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          title: Row(
            children: [
              Text(historyItem.name, style: theme.textTheme.titleMedium),
              const Spacer(),
              ScoreTag(score: historyItem.score),
            ],
          ),
          subtitle: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    size: spanTheme?.fontSize,
                    color: spanTheme?.color,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    HumanFormats.formatDate(
                      historyItem.timestamp,
                      format: "MM/dd/yyyy, h:mm:ss",
                    ),
                    style: spanTheme,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: spanTheme?.fontSize,
                    color: spanTheme?.color,
                  ),
                  Text(historyItem.location, style: spanTheme),
                ],
              ),
            ],
          ),
          children: [
            Padding(
              padding: const EdgeInsetsGeometry.only(left: 68, right: 36),
              child: Divider(color: theme.dividerColor),
            ),
            ListTile(
              leading: const SizedBox(width: 40, height: 40),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text("ID:", style: spanTheme),
                            const SizedBox(width: 4),
                            Text(historyItem.id, style: contentTheme),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Row(
                          children: [
                            Text("Age:", style: spanTheme),
                            const SizedBox(width: 4),
                            Text(
                              HumanFormats.calculateAge(
                                historyItem.birthdate,
                              ).toString(),
                              style: contentTheme,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text("DOB:", style: spanTheme),
                            const SizedBox(width: 4),
                            Text(
                              HumanFormats.formatDate(
                                historyItem.birthdate,
                                format: "MMMM dd, yyyy",
                              ),
                              style: contentTheme,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Row(
                          children: [
                            Text("Gender:", style: spanTheme),
                            const SizedBox(width: 4),
                            Text(historyItem.gender, style: contentTheme),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text("Notes:", style: spanTheme),
                      const SizedBox(width: 4),
                      Text(historyItem.notes, style: contentTheme),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
