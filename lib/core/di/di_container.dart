import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '/config/app_router.dart';
import '/features/audio_list/injection_container.dart';
import '../resources/dio_provider.dart';

GetIt ls = GetIt.instance;

Future<void> setupDI() async {
  ls.registerSingleton<AppRouter>(AppRouter());
  ls.registerSingleton<Dio>(DioProvider.getInstance.client);

  setUpAudioList();
}
