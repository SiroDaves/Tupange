import 'dart:math' as math;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/layout/utils/app_breakpoints.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../../blocs/home/home_bloc.dart';
import '../../../cubits/dashboard/planet_selection/planet_selection_helper_cubit.dart';
import '../../../widgets/stylized_button.dart';
import '../../../widgets/stylized_container.dart';
import '../../../widgets/stylized_icon.dart';
import '../widgets/scroll_buttons.dart';

class PlanetAnimationToggleButtonx extends StatelessWidget {
  const PlanetAnimationToggleButtonx({super.key});

  @override
  Widget build(BuildContext context) {
    final state =
        context.select((PlanetSelectionHelperCubit cubit) => cubit.state);

    final bool isPaused = state.isPaused;

    return StylizedButton(
      onPressed: () {
        context.read<PlanetSelectionHelperCubit>().onPlanetMovementToggle();
      },
      child: StylizedContainer(
        color: isPaused ? Colors.grey : Colors.blueAccent,
        padding: const EdgeInsets.all(12.0),
        child: StylizedIcon(
          icon: isPaused ? FontAwesomeIcons.pause : FontAwesomeIcons.play,
          size: 15.0,
          offset: 1.0,
          strokeWidth: 5.0,
        ),
      ),
    );
  }
}

class HomePageSmall extends StatelessWidget {
  final Widget child;

  const HomePageSmall({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ScrollableSolarSystem(solarSystem: child);
  }
}

class HomePageMedium extends StatelessWidget {
  final Widget child;

  const HomePageMedium({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ScrollableSolarSystem(solarSystem: child);
  }
}

class ScrollableSolarSystem extends StatefulWidget {
  final Widget solarSystem;

  const ScrollableSolarSystem({super.key, required this.solarSystem});

  @override
  State<ScrollableSolarSystem> createState() => _ScrollableSolarSystemState();
}

class _ScrollableSolarSystemState extends State<ScrollableSolarSystem> {
  final _controller = ScrollController();

  double get width => MediaQuery.of(context).size.width;

  double _scrollOffset = 0.0;

  void _scrollListener() {
    _scrollOffset = _controller.offset;
  }

  void _moveToOffset() {
    _controller.animateTo(
      _scrollOffset,
      duration: AppConstants.kMS350,
      curve: Curves.easeInOut,
    );
  }

  void _onMoveNext() {
    _scrollOffset =
        math.min(AppBreakpoints.medium - width, _scrollOffset + width);
    _moveToOffset();
  }

  void _onMovePrev() {
    _scrollOffset = math.max(0.0, _scrollOffset - width);
    _moveToOffset();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // solar system
        SingleChildScrollView(
          controller: _controller,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: AppBreakpoints.medium,
            child: widget.solarSystem,
          ),
        ),

        // control buttons
        Align(
          alignment: AppConstants.kFOBottomCenter,
          child: ScrollButtons(onPrevious: _onMovePrev, onNext: _onMoveNext),
        ),
      ],
    );
  }
}

class HomePageLarge extends StatelessWidget {
  final HomeReady state;

  const HomePageLarge({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: LayoutBuilder(
        builder: (ctx, dimens) {
          return Center(
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                initialPage: 0,
                autoPlay: true,
              ),
              items: state.games.map((game) {
                return Builder(
                  builder: (BuildContext ctx) {
                    return MenuCarousel(
                      game: game,
                      height: dimens.maxHeight,
                      onPressed: () {
                        //context.read<AudioPlayerCubit>().buttonClickAudio();
                        //context.read<GameSelectionCubit>().onGameSelected(game);
                      },
                    );
                  },
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
