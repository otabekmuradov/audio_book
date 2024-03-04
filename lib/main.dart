import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';

import 'config/app_router.dart';
import 'core/audio/audio_handler.dart';
import 'core/di/bloc_scope.dart';
import 'core/di/di_container.dart';
import 'core/resources/themedata.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDI();
  await AudioService.init(
    builder: () => ls<MyAudioHandler>(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.audiobook.example',
      androidNotificationChannelName: 'Audio Playback',
      androidNotificationOngoing: true,
    ),
  );
  
  runApp(
    BlocScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final _router = AppRouter();

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      routerConfig: _router.config(),
    );
  }
}