import '../../domain/entities/audiobook_info.dart';
import '../models/audiobook_info_dto.dart';

class AudioBookInfoMapper {
  static List<AudioBookInfo> mapAudioBookInfo(
          List<AudioBookInfoDto> audioBookInfoDto) =>
      audioBookInfoDto.map((data) {
        return map(audioBookInfoDto: data);
      }).toList();

  static AudioBookInfo map({required AudioBookInfoDto audioBookInfoDto}) =>
      AudioBookInfo(
        id: audioBookInfoDto.id ?? '',
        image: audioBookInfoDto.image ?? '',
        text: audioBookInfoDto.text ?? '',
        duration: audioBookInfoDto.duration ?? '',
        rating: audioBookInfoDto.rating ?? '',
        title: audioBookInfoDto.title ?? '',
        audio: audioBookInfoDto.audio ?? '',
      );
}
