import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import '/core/error/exception.dart';
import '/core/usecase/usecase.dart';
import '/core/resources/app_keys.dart';
import '../models/audiobook_info_dto.dart';

abstract class AudioBookRemoteDataSource {
  Future<List<AudioBookInfoDto>> getAudioBookInfo(NoParams params);
  Future<String?> downloadBook(String url);
}

class AudioBookRemoteDataSourceImpl extends AudioBookRemoteDataSource {
  final Dio dio;

  AudioBookRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<AudioBookInfoDto>> getAudioBookInfo(NoParams params) async {
    try {
      final response = await dio.get(AppKeys.audioBookInfoEndpoint);
      return compute(parseAudioBookRemoteSource, response.data);
    } catch (e) {
      throw ServerException();
    }
  }

  static List<AudioBookInfoDto> parseAudioBookRemoteSource(data) {
    final i = data as Iterable;
    return List<AudioBookInfoDto>.from(
      i.map(
        (e) => AudioBookInfoDto.fromJson(e),
      ),
    );
  }

  @override
  Future<String?> downloadBook(String url) async {
    const String downloadDirectory0 = 'downloaded_files';
    try {
      String directoryPath = await _getFilePath();
      Directory downloadDirectory =
          Directory('$directoryPath/$downloadDirectory0');
      if (!downloadDirectory.existsSync()) {
        downloadDirectory.createSync(recursive: true);
      }

      final String filePath =
          '${downloadDirectory.path}/${DateTime.now().millisecondsSinceEpoch}.mp3';
      await dio.download(url, filePath);

      return filePath;
    } catch (e) {
      throw LocalException();
    }
  }

  static Future<String> _getFilePath() async {
    try {
      if (Platform.isIOS) {
        Directory appDir = await getApplicationDocumentsDirectory();
        return appDir.path;
      } else {
        Directory downloadDir = Directory('/storage/emulated/0/Download/');
        if (!await downloadDir.exists()) {
          downloadDir = (await getExternalStorageDirectory())!;
        }
        return downloadDir.path;
      }
    } catch (err) {
      print("Cannot get download folder path $err");
      throw LocalException();
    }
  }
}
