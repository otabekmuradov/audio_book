import 'package:audio_service/audio_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/w_controller.dart';
import '../widgets/w_progress_bar.dart';
import '../../../../core/audio/audio_handler.dart';
import '/core/di/di_container.dart';
import '/core/resources/app_colors.dart';

@RoutePage()
class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final audioHandler = ls<MyAudioHandler>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.player1stBgColor.withOpacity(0.1),
            statusBarIconBrightness: Brightness.light),
        backgroundColor: AppColors.player1stBgColor.withOpacity(0.9),
        leading: GestureDetector(
          onTap: () async {
            audioHandler.pause();
            context.router.pop();
          },
          child: const Icon(
            Icons.chevron_left_outlined,
            color: AppColors.white,
            size: 28,
          ),
        ),
      ),
      body: StreamBuilder<MediaItem?>(
          stream: audioHandler.mediaItem,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              MediaItem item = snapshot.data!;
              return SafeArea(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.sizeOf(context).height / 2.5,
                          color: AppColors.player1stBgColor.withOpacity(0.9),
                        ),
                        Container(
                          height: MediaQuery.sizeOf(context).height / 2,
                          color: AppColors.player2ndBgColor,
                        ),
                      ],
                    ),
                    Positioned(
                      top: 150,
                      width: 410,
                      height: 300,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 82),
                          child: Column(
                            children: [
                              Text(
                                item.title,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(item.album ?? ''),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 22),
                                child: WProgressBar(
                                  item: item,
                                ),
                              ),
                              const WPlayerControl(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.sizeOf(context).width / 2.8,
                      top: 85,
                      height: 120,
                      width: 120,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              item.artUri.toString(),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          }),
    );
  }
}
