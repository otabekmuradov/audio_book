import 'package:audio_book/features/audio_list/domain/entities/audiobook_info.dart';
import 'package:dartz/dartz.dart';

import '/core/error/failure.dart';
import '/core/usecase/usecase.dart';
import '../repositories/audiobook_info_repo.dart';

class GetAudioBookInfo implements UseCase<List<AudioBookInfo>, NoParams> {
  final AudioBookInfoRepo repo;

  GetAudioBookInfo({required this.repo});

  @override
  Future<Either<Failure, List<AudioBookInfo>>> call(NoParams params) async {
    return await repo.getAudioBookInfo(params);
  }
}
