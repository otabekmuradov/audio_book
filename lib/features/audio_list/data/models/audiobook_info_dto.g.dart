// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audiobook_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AudioBookInfoDtoImpl _$$AudioBookInfoDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AudioBookInfoDtoImpl(
      id: json['id'] as String?,
      image: json['image'] as String?,
      duration: json['duration'] as String?,
      rating: json['rating'] as String?,
      title: json['title'] as String?,
      text: json['text'] as String?,
      audio: json['audio'] as String?,
    );

Map<String, dynamic> _$$AudioBookInfoDtoImplToJson(
        _$AudioBookInfoDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'duration': instance.duration,
      'rating': instance.rating,
      'title': instance.title,
      'text': instance.text,
      'audio': instance.audio,
    };
