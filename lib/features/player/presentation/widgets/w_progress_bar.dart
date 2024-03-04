import 'package:audio_service/audio_service.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';

import '/core/audio/audio_handler.dart';
import '/core/di/di_container.dart';

class WProgressBar extends StatelessWidget {
  final MediaItem item;
  const WProgressBar({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final audioHandler = ls<MyAudioHandler>();

    return StreamBuilder<Duration>(
      stream: AudioService.position,
      builder: (context, positionSnapshot) {
        if (positionSnapshot.data != null) {
          return ProgressBar(
            progress: positionSnapshot.data!,
            total: item.duration ?? Duration.zero,
            onSeek: (position) {
              audioHandler.seek(position);
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}