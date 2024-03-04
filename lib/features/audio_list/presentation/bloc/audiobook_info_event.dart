part of 'audiobook_info_bloc.dart';

@freezed
class AudioBookInfoEvent with _$AudioBookInfoEvent {
  const factory AudioBookInfoEvent.getAudioBookInfo() = _GetAudioBookInfo;
  const factory AudioBookInfoEvent.shuffleAudio() = _ShuffleAudio;
  const factory AudioBookInfoEvent.repeatAudio() = _RepeatAudio;
  const factory AudioBookInfoEvent.addQueueItems() = _AddQueueItems;
  const factory AudioBookInfoEvent.controlAudio({required bool isPlaying}) =
      _ControlAudio;
}
