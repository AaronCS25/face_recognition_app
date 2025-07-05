import 'package:flutter/material.dart';
import 'package:cvpr_face_recognition/config/config.dart';
import 'package:cvpr_face_recognition/features/shared/shared.dart';
import 'package:cvpr_face_recognition/features/individuals/individuals.dart';

class LogEntryCard extends StatelessWidget {
  final ProfileLogEntryEntity logEntry;

  const LogEntryCard({super.key, required this.logEntry});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: theme.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: theme.dividerColor),
      ),
      margin: const EdgeInsets.all(0.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_month_outlined, size: 12),
                const SizedBox(width: 4),
                Text(
                  HumanFormats.formatDate(
                    logEntry.timestamp,
                    format: "MM/dd/yyy",
                  ),
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                ScoreTag(score: logEntry.score),
              ],
            ),
            const SizedBox(height: 4.0),
            Row(
              children: [
                Icon(
                  Icons.watch_later_outlined,
                  size: 12,
                  color: theme.textTheme.bodyMedium?.color,
                ),
                const SizedBox(width: 4.0),
                Text(
                  HumanFormats.formatDate(
                    logEntry.timestamp,
                    format: "hh:mm:ss",
                  ),
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 4.0),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 12,
                  color: theme.textTheme.bodyMedium?.color,
                ),
                const SizedBox(width: 4.0),
                Text(logEntry.location, style: theme.textTheme.bodyMedium),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
