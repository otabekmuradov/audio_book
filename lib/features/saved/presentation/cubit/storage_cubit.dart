import 'package:audio_service/audio_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/audio/audio_handler.dart';
import '../../../../core/di/di_container.dart';
import '../../../audio_list/data/models/audiobook_info_dto.dart';
import '/core/storage/book_storage.dart';
import '../../../audio_list/domain/usecases/download_book.dart';
import '/core/error/failure.dart';
import '/core/resources/statuses.dart';

part 'storage_state.dart';
part 'storage_cubit.freezed.dart';

class StorageCubit extends Cubit<StorageState> {
  final BookStorage storage;
  final DownloadBook downloadBook;

  StorageCubit({required this.storage, required this.downloadBook})
      : super(const StorageState());

  void getBooks() async {
    final audioHandler = ls<MyAudioHandler>();

    emit(state.copyWith(status: Statuses.loading));
    final books = await storage.getBooks();

    final mediaItems = books.map((book) {
      double secondsDouble = double.parse(book.duration ?? '0.0');
      int seconds = secondsDouble.toInt();
      Duration duration = Duration(seconds: seconds);
      return MediaItem(
        id: book.id.toString(),
        album: book.text,
        title: book.title ?? '',
        duration: duration,
        extras: <String, dynamic>{'url': book.audio},
        artUri: Uri.parse(book.image ?? ''),
      );
    }).toList();
    
    for (var mediaItem in mediaItems) {
      final audioSource = _createAudioSource(mediaItem);
      if (!audioHandler.playlist.children.contains(audioSource)) {
        await audioHandler.addQueueItem(mediaItem);
      }
    }

    emit(
      state.copyWith(
        audioBookInfo: books,
        status: Statuses.success,
      ),
    );
  }

  UriAudioSource _createAudioSource(MediaItem mediaItem) {
    return AudioSource.uri(
      Uri.parse(mediaItem.extras!['url'] as String),
      tag: mediaItem,
    );
  }

  void download(AudioBookInfoDto book) async {
    final books = await storage.getBooks();

    final bookIndex = books.indexWhere((b) => b.id == book.id);

    if (bookIndex == -1) {
      final failureOrPath = await downloadBook.call(
        DownloadParams(url: book.audio ?? ''),
      );

      failureOrPath.fold(
        (error) => null,
        (path) async {
          final books = List.of(state.audioBookInfo);
          if (path != null) {
            
            await storage.saveBooks(book);

            books.add(book);
            emit(state.copyWith(audioBookInfo: books));
          }
        },
      );
    }
  }

  
}
