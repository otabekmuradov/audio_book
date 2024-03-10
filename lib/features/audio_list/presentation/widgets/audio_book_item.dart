import 'package:audio_book/features/audio_list/data/models/audiobook_info_dto.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/audio/audio_handler.dart';
import '../../../saved/presentation/cubit/storage_cubit.dart';
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                              fit: BoxFit.cover),
                        ),
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      showPopupMenu(
                        context,
                        details.globalPosition,
                        AudioBookInfoDto(
                          id: item.id,
                          text: item.album,
                          title: item.title,
                          image: item.artUri.toString(),
                          audio: item.extras?['url'],
                          rating: state.audioBookInfo[index].rating,
                        ),
                      );
                    },
                    child: state.isPlaying
                        ? const SizedBox(width: 10)
                        : const Icon(
                            Icons.more_vert_outlined,
                            color: AppColors.btBgColor,
                          ),
                  )
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

void showPopupMenu(BuildContext context, Offset tapPosition,
    AudioBookInfoDto audioBookInfoDto) {
  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;
  final RelativeRect position =
      RelativeRect.fromSize(tapPosition & const Size(0, 0), overlay.size);

  showMenu(
    context: context,
    position: position,
    items: [
      const PopupMenuItem(
        value: 'download',
        child: Row(
          children: [
            Icon(Icons.download, color: Colors.black),
            SizedBox(width: 10),
            Text(
              'Download MP3',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],
        ),
      ),
    ],
  ).then(
    (value) {
      if (value != null && value == 'download') {
        context.read<StorageCubit>().download(audioBookInfoDto);
      }
    },
  );
}
