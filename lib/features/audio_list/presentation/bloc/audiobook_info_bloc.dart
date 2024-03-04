import 'package:audio_service/audio_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';

import '../../../../core/audio/audio_handler.dart';
import '/core/usecase/usecase.dart';
import '../../domain/usecases/get_audiobook_info.dart';
import '/core/error/failure.dart';
import '/core/resources/statuses.dart';
import '../../domain/entities/audiobook_info.dart';

part 'audiobook_info_event.dart';

part 'audiobook_info_state.dart';

part 'audiobook_info_bloc.freezed.dart';

class AudioBookInfoBloc extends Bloc<AudioBookInfoEvent, AudioBookInfoState> {
  final GetAudioBookInfo getAudioBookInfo;
  final MyAudioHandler audioHandler;

  AudioBookInfoBloc({
    required this.audioHandler,
    required this.getAudioBookInfo,
  }) : super(const AudioBookInfoState()) {
    on<_GetAudioBookInfo>(_getInfo);
    on<_ShuffleAudio>(_shuffleAudio);
    on<_RepeatAudio>(_repeatAudio);
    on<_ControlAudio>(_controlAudio);
    on<_AddQueueItems>(_addQueueItems);
    audioHandler.playbackState.stream.listen(_handlePlaybackState);
  }

  Future<void> _getInfo(
    _GetAudioBookInfo event,
    Emitter<AudioBookInfoState> emit,
  ) async {
    emit(state.copyWith.call(status: Statuses.loading));
    final response = await getAudioBookInfo.call(NoParams());
    await response.fold(
      (left) async => emit(
        state.copyWith.call(
          status: Statuses.error,
          error: left,
        ),
      ),
      (right) async {
        final mediaItems = right.map(
          (book) {
            double secondsDouble = double.parse(book.duration);
            int seconds = secondsDouble.toInt();
            Duration duration = Duration(seconds: seconds);
            // print(duration);
            return MediaItem(
              id: book.id.toString(),
              album: book.text,
              title: book.title,
              duration: duration,
              extras: <String, dynamic>{'url': book.audio},
              artUri: Uri.parse(book.image),
            );
          },
        ).toList();
        await audioHandler.addQueueItems(mediaItems);
        emit(
          state.copyWith.call(
            audioBookInfo: right,
            status: Statuses.success,
          ),
        );
      },
    );
  }

  Future<void> _shuffleAudio(
    _ShuffleAudio event,
    Emitter emit,
  ) async {
    if (state.isShuffleEnabled) {
      audioHandler.setShuffleMode(AudioServiceShuffleMode.none);
      emit(state.copyWith(isShuffleEnabled: false));
    } else {
      audioHandler.setShuffleMode(AudioServiceShuffleMode.all);
      emit(state.copyWith(isShuffleEnabled: true));
    }
  }

  Future<void> _repeatAudio(
    _RepeatAudio event,
    Emitter emit,
  ) async {
    final repeatMode = state.repeatState;
    if (repeatMode == RepeatState.off) {
      audioHandler.setRepeatMode(AudioServiceRepeatMode.one);
      emit(state.copyWith(repeatState: RepeatState.repeatSong));
    } else {
      audioHandler.setRepeatMode(AudioServiceRepeatMode.none);
      emit(state.copyWith(repeatState: RepeatState.off));
    }
  }

  Future<void> _addQueueItems(
    _AddQueueItems event,
    Emitter emit,
  ) async {
    final mediaItems = state.audioBookInfo.map((book) {
      double secondsDouble = double.parse(book.duration);
      int seconds = secondsDouble.toInt();
      Duration duration = Duration(seconds: seconds);
    
      return MediaItem(
        id: book.id.toString(),
        album: book.text,
        title: book.title,
        duration: duration,
        extras: <String, dynamic>{'url': book.audio},
        artUri: Uri.parse(book.image),
      );
    }).toList();
  
    await audioHandler.addQueueItems(mediaItems);
  }

  Future<void> _controlAudio(
    _ControlAudio event,
    Emitter emit,
  ) async {
    emit(state.copyWith(isPlaying: event.isPlaying));
  }

  void _handlePlaybackState(PlaybackState playbackState) {
    bool isPlaying = playbackState.playing;

    add(AudioBookInfoEvent.controlAudio(isPlaying: isPlaying));
  }
}
