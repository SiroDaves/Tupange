import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/playing/playing_bloc.dart';
import '../../blocs/puzzle/puzzle_bloc.dart';
import '../../blocs/timer/timer_bloc.dart';
import '../../cubits/audio/audio_player_cubit.dart';
import '../../cubits/menu/game_selection_cubit.dart';
import '../../cubits/menu/level_selection_cubit.dart';
import '../../cubits/puzzle/puzzle_helper_cubit.dart';
import '../../../common/utils/app_logger.dart';
import '../../../common/utils/constants/app_dimens.dart';
import '../../../common/utils/helpers/modal_helpers.dart';
import '../completion/completion_dialog.dart';
import '../layout/puzzle_layout_delegate.dart';
import '../layout/responsive_layout_builder.dart';

class PlayingBoard extends StatefulWidget {
  final List<Widget> tiles;

  const PlayingBoard({Key? key, required this.tiles}) : super(key: key);

  @override
  State<PlayingBoard> createState() => PlayingBoardState();
}

class PlayingBoardState extends State<PlayingBoard> {
  Timer? completePuzzleTimer;

  void onPuzzleCompletionDialog(BuildContext context) async {
    AppLogger.log('PlayingBoard: _onPuzzleCompletionDialog');

    // play completion audio
    context.read<AudioPlayerCubit>().completion();

    // after dialog finishes, reset the puzzle to initial state
    Timer(AppDimens.kMS300, () {
      context.read<GameBloc>().add(const ResetEvent());
    });

    // show dialog
    showAppDialog(
      context: context,

      /// for medium and large screen, same size
      sameSize: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: context.read<LevelSelectionCubit>()),
          BlocProvider.value(value: context.read<GameSelectionCubit>()),
          BlocProvider.value(value: context.read<PuzzleHelperCubit>()),
          BlocProvider.value(value: context.read<TimerBloc>()),
          BlocProvider.value(value: context.read<PuzzleBloc>()),
        ],
        child: CompletionDialog(),
      ),
    );
  }

  @override
  void dispose() {
    completePuzzleTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PuzzleBloc, PuzzleState>(
      listener: (BuildContext context, PuzzleState state) {
        if (state.puzzleStatus == PuzzleStatus.complete) {
          completePuzzleTimer = Timer(AppDimens.kMS500, () {
            onPuzzleCompletionDialog(context);
          });
        }
      },
      child: ResponsiveLayoutBuilder(
        small: (_, Widget? child) => PuzzleBoard(
          child: child,
          size: BoardSize.small,
        ),
        medium: (_, Widget? child) => PuzzleBoard(
          child: child,
          size: BoardSize.medium,
        ),
        large: (_, Widget? child) => PuzzleBoard(
          child: child,
          size: BoardSize.large,
        ),
        child: (_) => Stack(children: widget.tiles),
      ),
    );
  }
}

class PuzzleBoard extends StatelessWidget {
  final double size;
  final Widget? child;

  const PuzzleBoard({
    Key? key,
    this.child,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(dimension: size, child: child);
  }
}
