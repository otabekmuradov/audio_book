import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audio_service/audio_service.dart';

import '../../../../core/audio/audio_handler.dart';
import '/config/routes.dart';
import '../widgets/audio_book_item.dart';
import '/core/resources/statuses.dart';
import '/core/widgets/w_loader.dart';
import '../bloc/audiobook_info_bloc.dart';
import '/core/di/di_container.dart';

@RoutePage()
class AudioListPage extends StatelessWidget implements AutoRouteWrapper {
  const AudioListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final audioHandler = ls<MyAudioHandler>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audiobook List'),
      ),
      body: BlocBuilder<AudioBookInfoBloc, AudioBookInfoState>(
        builder: (context, state) {
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
                          title: book.title,
                          extras: {'url': book.audio},
                          artUri: Uri.parse(book.image)
                        ))
                    .toList();
                return AudioBookItem(
                  book: state.audioBookInfo[index],
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

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => ls<AudioBookInfoBloc>()
        ..add(
          const AudioBookInfoEvent.getAudioBookInfo(),
        ),
      child: this,
    );
  }
}
