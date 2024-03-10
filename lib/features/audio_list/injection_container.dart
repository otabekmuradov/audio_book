import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/audio/audio_handler.dart';
import '../../core/storage/book_storage.dart';
import '../saved/presentation/cubit/storage_cubit.dart';
import '/core/di/di_container.dart';
import 'data/datasources/get_audiobook_remote_source.dart';
import 'data/repositories/audiobook_info_repo_impl.dart';
import 'domain/repositories/audiobook_info_repo.dart';
import 'domain/usecases/download_book.dart';
import 'domain/usecases/get_audiobook_info.dart';
import 'presentation/bloc/audiobook_info_bloc.dart';

Future<void> setUpAudioList() async {
  //! Features - AudioListScreen

  // Core
  ls.registerLazySingleton<MyAudioHandler>(() => MyAudioHandler(ls()));
  ls.registerLazySingleton<BookStorage>(
      () => BookStorage(storage: ls()));

  // Bloc
  ls.registerFactory(
    () => AudioBookInfoBloc(
      getAudioBookInfo: ls(),
      audioHandler: ls(),
    ),
  );

  ls.registerFactory<StorageCubit>(
    () => StorageCubit(
      storage: ls(),
      downloadBook: ls(),
    ),
  );

  //Usecases
  ls.registerLazySingleton(
    () => GetAudioBookInfo(
      repo: ls(),
    ),
  );

  ls.registerLazySingleton<DownloadBook>(
    () => DownloadBook(
      ls(),
    ),
  );

  // repositories
  ls.registerLazySingleton<AudioBookInfoRepo>(
    () => AudioBookInfoRepoImpl(
      remoteDataSource: ls(),
    ),
  );

  //DataSources
  ls.registerLazySingleton<AudioBookRemoteDataSource>(
    () => AudioBookRemoteDataSourceImpl(
      dio: ls(),
    ),
  );

  // External
  ls.registerLazySingleton<AudioPlayer>(() => AudioPlayer());
  SharedPreferences prefs = await SharedPreferences.getInstance();
  ls.registerLazySingleton<SharedPreferences>(() => prefs);
}
