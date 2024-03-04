import 'package:dartz/dartz.dart';

import '/core/error/exception.dart';
import '/core/error/failure.dart';
import '/core/usecase/usecase.dart';
import '../../domain/entities/audiobook_info.dart';
import '../../domain/repositories/audiobook_info_repo.dart';
import '../datasources/get_audiobook_remote_source.dart';
import '../mapper/audiobook_info_mapper.dart';

class AudioBookInfoRepoImpl extends AudioBookInfoRepo {
  final AudioBookRemoteDataSource remoteDataSource;

  AudioBookInfoRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<AudioBookInfo>>> getAudioBookInfo(
      NoParams params) async {
    try {
      final data = await remoteDataSource.getAudioBookInfo(params);
      return Right(
        AudioBookInfoMapper.mapAudioBookInfo(data),
      );
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, String?>> downloadBook(String url) async {
    try {
      final result = await remoteDataSource.downloadBook(url);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
