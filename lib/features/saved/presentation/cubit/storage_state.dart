part of 'storage_cubit.dart';

@freezed
class StorageState with _$StorageState {
  const factory StorageState({
    @Default(Statuses.initial) Statuses status,
    Failure? error,
    @Default([]) List<AudioBookInfoDto> audioBookInfo,
  }) = _StorageState;
}
