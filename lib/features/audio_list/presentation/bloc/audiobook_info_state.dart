part of 'audiobook_info_bloc.dart';

enum RepeatState { off, repeatSong }

@freezed
class AudioBookInfoState with _$AudioBookInfoState {
  const factory AudioBookInfoState({
    @Default(Statuses.initial) Statuses status,
    Failure? error,
    @Default([]) List<AudioBookInfo> audioBookInfo,
    @Default(false) final bool isPlaying,
    @Default(RepeatState.off) final RepeatState repeatState,
    @Default(false) final bool isShuffleEnabled,
  }) = _AudioBookInfoState;
}
