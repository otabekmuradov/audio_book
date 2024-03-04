import 'package:audio_book/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

import '/core/error/failure.dart';
import '../entities/audiobook_info.dart';

abstract class AudioBookInfoRepo {
  Future<Either<Failure, List<AudioBookInfo>>> getAudioBookInfo(NoParams params);
  Future<Either<Failure, String?>> downloadBook(String url);
}
