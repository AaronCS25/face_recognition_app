import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cvpr_face_recognition/config/config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cvpr_face_recognition/features/shared/shared.dart';
import 'package:cvpr_face_recognition/features/individuals/individuals.dart';

class ProfilePreviewCard extends StatelessWidget {
  final ProfilePreviewEntity profilePreview;

  const ProfilePreviewCard({super.key, required this.profilePreview});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => context.push("/individuals/${profilePreview.id}"),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundImage: null,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: profilePreview.imageUrl,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(strokeWidth: 2),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profilePreview.name,
                      style: theme.textTheme.titleMedium,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          size: theme.textTheme.bodyMedium?.fontSize,
                          color: theme.textTheme.bodyMedium?.color,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          "Last seen: ${HumanFormats.timeAgo(profilePreview.lastSeen)}",
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    _LimitedTagWrap(
                      tags: profilePreview.tags,
                      recognitionCount: profilePreview.recognitionCount,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12.0),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16.0,
                color: theme.textTheme.bodyMedium?.color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LimitedTagWrap extends StatelessWidget {
  final List<String> tags;
  final int recognitionCount;

  const _LimitedTagWrap({required this.tags, required this.recognitionCount});

  @override
  Widget build(BuildContext context) {
    final allTags = [
      CustomTag(
        label:
            '$recognitionCount recognition${recognitionCount > 1 ? 's' : ''}',
        type: TagType.secondary,
      ),
      ...tags.map((t) => CustomTag(label: t, type: TagType.primary)),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        double availableWidth = constraints.maxWidth;
        double usedWidth = 0;
        const spacing = 8.0;

        final List<Widget> visibleTags = [];
        int remaining = 0;

        for (var tag in allTags) {
          final textWidth = _estimateTagWidth(context, tag);
          if (usedWidth + textWidth > availableWidth) {
            remaining = allTags.length - visibleTags.length;
            break;
          }
          visibleTags.add(tag);
          usedWidth += textWidth + spacing;
        }

        if (remaining > 0) {
          visibleTags.add(
            CustomTag(label: '+$remaining', type: TagType.tertiary),
          );
        }

        return Wrap(spacing: spacing, runSpacing: 4, children: visibleTags);
      },
    );
  }

  double _estimateTagWidth(BuildContext context, CustomTag tag) {
    final text = tag.label;
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.labelMedium!.copyWith(
      fontWeight: FontWeight.w600,
    );
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    const horizontalPadding = 22.0;
    return textPainter.width + horizontalPadding;
  }
}
