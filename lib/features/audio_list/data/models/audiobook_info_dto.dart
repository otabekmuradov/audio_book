import 'package:freezed_annotation/freezed_annotation.dart';

part 'audiobook_info_dto.g.dart';
part 'audiobook_info_dto.freezed.dart';

@freezed
class AudioBookInfoDto with _$AudioBookInfoDto {
  const factory AudioBookInfoDto({
    String? id,
    String? image,
    String? duration,
    String? rating,
    String? title,
    String? text,
    String? audio,
  }) = _AudioBookInfoDto;

  factory AudioBookInfoDto.fromJson(Map<String, dynamic> json) =>
      _$AudioBookInfoDtoFromJson(json);
}