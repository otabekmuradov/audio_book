import 'package:audio_service/audio_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes.dart';
import '../../../../core/audio/audio_handler.dart';
import '../../../../core/di/di_container.dart';
import '../../../../core/resources/statuses.dart';
import '../../../../core/widgets/w_loader.dart';
import '../cubit/storage_cubit.dart';
import '../widget/saved_item.dart';

@RoutePage()
class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final audioHandler = ls<MyAudioHandler>();

    return Scaffold(
      appBar: AppBar(title: const Text('Saved')),
      body: BlocBuilder<StorageCubit, StorageState>(
        builder: (context, state) {
          //print(state.audioBookInfo.first);
          if (state.status == Statuses.success ||
              (state.audioBookInfo.isNotEmpty)) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: state.audioBookInfo.length,
              itemBuilder: (context, index) {
                final mediaItems = state.audioBookInfo
                    .map((book) => MediaItem(
                        id: book.id.toString(),
                        album: book.text,
                        title: book.title ?? '',
                        extras: {'url': book.audio},
                        artUri: Uri.parse(book.image ?? '')))
                    .toList();
                //print(mediaItems.first.album);
                return SavedItem(
                  audioBookInfoDto: state.audioBookInfo[index],
                  item: mediaItems[index],
                  index: index,
                  onTap: () {
                    audioHandler.addMediaItem(mediaItems[index]);
                    audioHandler.play();
                    context.router.pushNamed(Routes.player);
                  },
                );
              },
            );
          } else if (state.status == Statuses.error) {
            return Center(
              child: Text(state.error?.toString() ?? ''),
            );
          }
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.8,
            child: const WLoader(),
          );
        },
      ),
    );
  }
}
