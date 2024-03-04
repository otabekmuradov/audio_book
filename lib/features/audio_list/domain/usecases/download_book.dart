import 'package:audio_book/features/audio_list/domain/repositories/audiobook_info_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';

class DownloadBook extends UseCase<String?, DownloadParams> {
  final AudioBookInfoRepo repo;

  DownloadBook(this.repo);

  @override
  Future<Either<Failure, String?>> call(DownloadParams params) async {
    return await repo.downloadBook(params.url);
  }
}

class DownloadParams {
  final String url;

  const DownloadParams({required this.url});
}
