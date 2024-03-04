import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/audio/audio_handler.dart';
import '/core/di/di_container.dart';
import '/core/resources/app_colors.dart';
import '/core/resources/dimension.dart';
import '/gen/assets.gen.dart';
import '../../domain/entities/audiobook_info.dart';
import '../bloc/audiobook_info_bloc.dart';

class AudioBookItem extends StatelessWidget {
  final AudioBookInfo book;
  final VoidCallback onTap;
  final MediaItem item;
  final int index;

  const AudioBookItem(
      {super.key,
      required this.book,
      required this.onTap,
      required this.item,
      required this.index});

  @override
  Widget build(BuildContext context) {
    final audioHandler = ls<MyAudioHandler>();
    final state = context.watch<AudioBookInfoBloc>().state;
    return StreamBuilder<MediaItem?>(
      stream: audioHandler.mediaItem,
      builder: (BuildContext context, AsyncSnapshot<MediaItem?> snapshot) {
        if (snapshot.data != null) {
          return GestureDetector(
            onTap: () {
              if (snapshot.data! != item) {
                audioHandler.skipToQueueItem(index);
              }
              onTap();
            },
            child: Card(
              elevation: 1,
              color: AppColors.white.withOpacity(0.5),
              margin: Dimensions.paddingH12V8,
              shadowColor: Colors.white30,
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: 110,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(
                          item.artUri.toString(),
                          ),
                          fit: BoxFit.cover
                        ),),
                  ),
                  Padding(
                    padding: Dimensions.paddingLeft24Right34,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: Dimensions.paddingV20,
                          child: Text(
                            item.album ?? '',
                            style: const TextStyle(
                                fontSize: 16, color: AppColors.C_6A6D7C),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: Dimensions.paddingRight10,
                              child: Assets.svg.icons.svg(
                                height: 20,
                                width: 20,
                              ),
                            ),
                            Text(
                              state.audioBookInfo[index].rating,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
