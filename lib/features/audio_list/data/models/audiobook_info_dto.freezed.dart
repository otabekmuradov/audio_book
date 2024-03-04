// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audiobook_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AudioBookInfoDto _$AudioBookInfoDtoFromJson(Map<String, dynamic> json) {
  return _AudioBookInfoDto.fromJson(json);
}

/// @nodoc
mixin _$AudioBookInfoDto {
  String? get id => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;
  String? get rating => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  String? get audio => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AudioBookInfoDtoCopyWith<AudioBookInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioBookInfoDtoCopyWith<$Res> {
  factory $AudioBookInfoDtoCopyWith(
          AudioBookInfoDto value, $Res Function(AudioBookInfoDto) then) =
      _$AudioBookInfoDtoCopyWithImpl<$Res, AudioBookInfoDto>;
  @useResult
  $Res call(
      {String? id,
      String? image,
      String? duration,
      String? rating,
      String? title,
      String? text,
      String? audio});
}

/// @nodoc
class _$AudioBookInfoDtoCopyWithImpl<$Res, $Val extends AudioBookInfoDto>
    implements $AudioBookInfoDtoCopyWith<$Res> {
  _$AudioBookInfoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? duration = freezed,
    Object? rating = freezed,
    Object? title = freezed,
    Object? text = freezed,
    Object? audio = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      audio: freezed == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AudioBookInfoDtoImplCopyWith<$Res>
    implements $AudioBookInfoDtoCopyWith<$Res> {
  factory _$$AudioBookInfoDtoImplCopyWith(_$AudioBookInfoDtoImpl value,
          $Res Function(_$AudioBookInfoDtoImpl) then) =
      __$$AudioBookInfoDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? image,
      String? duration,
      String? rating,
      String? title,
      String? text,
      String? audio});
}

/// @nodoc
class __$$AudioBookInfoDtoImplCopyWithImpl<$Res>
    extends _$AudioBookInfoDtoCopyWithImpl<$Res, _$AudioBookInfoDtoImpl>
    implements _$$AudioBookInfoDtoImplCopyWith<$Res> {
  __$$AudioBookInfoDtoImplCopyWithImpl(_$AudioBookInfoDtoImpl _value,
      $Res Function(_$AudioBookInfoDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? duration = freezed,
    Object? rating = freezed,
    Object? title = freezed,
    Object? text = freezed,
    Object? audio = freezed,
  }) {
    return _then(_$AudioBookInfoDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      audio: freezed == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AudioBookInfoDtoImpl implements _AudioBookInfoDto {
  const _$AudioBookInfoDtoImpl(
      {this.id,
      this.image,
      this.duration,
      this.rating,
      this.title,
      this.text,
      this.audio});

  factory _$AudioBookInfoDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioBookInfoDtoImplFromJson(json);

  @override
  final String? id;
  @override
  final String? image;
  @override
  final String? duration;
  @override
  final String? rating;
  @override
  final String? title;
  @override
  final String? text;
  @override
  final String? audio;

  @override
  String toString() {
    return 'AudioBookInfoDto(id: $id, image: $image, duration: $duration, rating: $rating, title: $title, text: $text, audio: $audio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioBookInfoDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.audio, audio) || other.audio == audio));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, image, duration, rating, title, text, audio);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioBookInfoDtoImplCopyWith<_$AudioBookInfoDtoImpl> get copyWith =>
      __$$AudioBookInfoDtoImplCopyWithImpl<_$AudioBookInfoDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AudioBookInfoDtoImplToJson(
      this,
    );
  }
}

abstract class _AudioBookInfoDto implements AudioBookInfoDto {
  const factory _AudioBookInfoDto(
      {final String? id,
      final String? image,
      final String? duration,
      final String? rating,
      final String? title,
      final String? text,
      final String? audio}) = _$AudioBookInfoDtoImpl;

  factory _AudioBookInfoDto.fromJson(Map<String, dynamic> json) =
      _$AudioBookInfoDtoImpl.fromJson;

  @override
  String? get id;
  @override
  String? get image;
  @override
  String? get duration;
  @override
  String? get rating;
  @override
  String? get title;
  @override
  String? get text;
  @override
  String? get audio;
  @override
  @JsonKey(ignore: true)
  _$$AudioBookInfoDtoImplCopyWith<_$AudioBookInfoDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
