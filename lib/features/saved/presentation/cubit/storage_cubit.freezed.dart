// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'storage_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StorageState {
  Statuses get status => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;
  List<AudioBookInfoDto> get audioBookInfo =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StorageStateCopyWith<StorageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StorageStateCopyWith<$Res> {
  factory $StorageStateCopyWith(
          StorageState value, $Res Function(StorageState) then) =
      _$StorageStateCopyWithImpl<$Res, StorageState>;
  @useResult
  $Res call(
      {Statuses status, Failure? error, List<AudioBookInfoDto> audioBookInfo});
}

/// @nodoc
class _$StorageStateCopyWithImpl<$Res, $Val extends StorageState>
    implements $StorageStateCopyWith<$Res> {
  _$StorageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? audioBookInfo = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Statuses,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
      audioBookInfo: null == audioBookInfo
          ? _value.audioBookInfo
          : audioBookInfo // ignore: cast_nullable_to_non_nullable
              as List<AudioBookInfoDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StorageStateImplCopyWith<$Res>
    implements $StorageStateCopyWith<$Res> {
  factory _$$StorageStateImplCopyWith(
          _$StorageStateImpl value, $Res Function(_$StorageStateImpl) then) =
      __$$StorageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Statuses status, Failure? error, List<AudioBookInfoDto> audioBookInfo});
}

/// @nodoc
class __$$StorageStateImplCopyWithImpl<$Res>
    extends _$StorageStateCopyWithImpl<$Res, _$StorageStateImpl>
    implements _$$StorageStateImplCopyWith<$Res> {
  __$$StorageStateImplCopyWithImpl(
      _$StorageStateImpl _value, $Res Function(_$StorageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? audioBookInfo = null,
  }) {
    return _then(_$StorageStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Statuses,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
      audioBookInfo: null == audioBookInfo
          ? _value._audioBookInfo
          : audioBookInfo // ignore: cast_nullable_to_non_nullable
              as List<AudioBookInfoDto>,
    ));
  }
}

/// @nodoc

class _$StorageStateImpl implements _StorageState {
  const _$StorageStateImpl(
      {this.status = Statuses.initial,
      this.error,
      final List<AudioBookInfoDto> audioBookInfo = const []})
      : _audioBookInfo = audioBookInfo;

  @override
  @JsonKey()
  final Statuses status;
  @override
  final Failure? error;
  final List<AudioBookInfoDto> _audioBookInfo;
  @override
  @JsonKey()
  List<AudioBookInfoDto> get audioBookInfo {
    if (_audioBookInfo is EqualUnmodifiableListView) return _audioBookInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_audioBookInfo);
  }

  @override
  String toString() {
    return 'StorageState(status: $status, error: $error, audioBookInfo: $audioBookInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StorageStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._audioBookInfo, _audioBookInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error,
      const DeepCollectionEquality().hash(_audioBookInfo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StorageStateImplCopyWith<_$StorageStateImpl> get copyWith =>
      __$$StorageStateImplCopyWithImpl<_$StorageStateImpl>(this, _$identity);
}

abstract class _StorageState implements StorageState {
  const factory _StorageState(
      {final Statuses status,
      final Failure? error,
      final List<AudioBookInfoDto> audioBookInfo}) = _$StorageStateImpl;

  @override
  Statuses get status;
  @override
  Failure? get error;
  @override
  List<AudioBookInfoDto> get audioBookInfo;
  @override
  @JsonKey(ignore: true)
  _$$StorageStateImplCopyWith<_$StorageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
