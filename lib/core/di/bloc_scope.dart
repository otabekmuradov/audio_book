import 'package:audio_book/features/audio_list/presentation/bloc/audiobook_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/saved/presentation/cubit/storage_cubit.dart';
import 'di_container.dart';

class BlocScope extends StatelessWidget {
  final Widget child;
  const BlocScope({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AudioBookInfoBloc>(
        create: (_) => ls<AudioBookInfoBloc>(),
      ),
      BlocProvider<StorageCubit>(
        create: (context) => ls<StorageCubit>(),
      ),
    ], child: child);
  }
}
