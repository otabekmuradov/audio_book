import 'package:audio_book/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../audio_list/presentation/bloc/audiobook_info_bloc.dart';
import '../../../../core/audio/audio_handler.dart';
import '/core/di/di_container.dart';

class WPlayerControl extends StatelessWidget {
  const WPlayerControl({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AudioBookInfoBloc>();
    final state = context.watch<AudioBookInfoBloc>().state;
    final playing = state.isPlaying;
    final audioHandler = ls<MyAudioHandler>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          IconButton(
            onPressed: () => bloc.add(const AudioBookInfoEvent.shuffleAudio()),
            icon: Icon(
              Icons.shuffle_rounded,
              color: state.isShuffleEnabled
                  ? AppColors.amber900
                  : AppColors.C_6A6D7C,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () => audioHandler.skipToPrevious(),
            icon: const Icon(
              Icons.skip_previous_rounded,
              color: AppColors.amber900,
            ),
          ),
          const SizedBox(width: 20),
          IconButton(
            onPressed: () {
              if (playing) {
                audioHandler.pause();
              } else {
                audioHandler.play();
              }
            },
            icon: Icon(
              playing ? Icons.pause_circle_filled : Icons.play_circle_filled,
            ),
            iconSize: 50,
            color: AppColors.amber900,
          ),
          const SizedBox(width: 20),
          IconButton(
            onPressed: () => audioHandler.skipToNext(),
            icon: const Icon(
              Icons.skip_next_rounded,
              color: AppColors.amber900,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () => bloc.add(const AudioBookInfoEvent.repeatAudio()),
            icon: Icon(
              Icons.repeat_rounded,
              color: state.repeatState == RepeatState.repeatSong
                  ? AppColors.amber900
                  : AppColors.C_6A6D7C,
            ),
          ),
        ],
      ),
    );
  }
}
