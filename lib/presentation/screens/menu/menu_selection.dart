import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/menu/menu_bloc.dart';
import '../../cubits/audio/audio_player_cubit.dart';
import '../../cubits/menu/game_selection_cubit.dart';
import '../../../data/models/game.dart';
import '../../../common/utils/constants/app_dimens.dart';
import '../../../common/utils/utils.dart';
import '../../widgets/menu/menu_carousel.dart';
import '../../widgets/stylized_text.dart';

class MenuSelection extends StatefulWidget {
  final Widget childWidget;

  const MenuSelection({Key? key, required this.childWidget}) : super(key: key);

  @override
  State<MenuSelection> createState() => MenuSelectionState();
}

class MenuSelectionState extends State<MenuSelection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimens.medium,
      child: widget.childWidget,
    );
  }
}

class MenuScreenSmall extends StatelessWidget {
  final Widget child;

  const MenuScreenSmall({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuSelection(childWidget: child);
  }
}

class MenuScreenMedium extends StatelessWidget {
  final Widget child;

  const MenuScreenMedium({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuSelection(childWidget: child);
  }
}

class MenuScreenLarge extends StatelessWidget {
  final MenuReady state;

  const MenuScreenLarge({Key? key, required this.state}) : super(key: key);

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
                        context.read<AudioPlayerCubit>().buttonClickAudio();
                        context.read<GameSelectionCubit>().onGameSelected(game);
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
    return SizedBox(
      child: LayoutBuilder(
        builder: (ctx, dimens) {
          int axisCount = (dimens.maxWidth / 300).round();
          return GridView.count(
            crossAxisCount: axisCount,
            children: state.games.map((game) {
              return Builder(
                builder: (BuildContext ctx) {
                  return GameItem(
                    game: game,
                    height: dimens.maxHeight,
                    onPressed: () {
                      context.read<AudioPlayerCubit>().buttonClickAudio();
                      context.read<GameSelectionCubit>().onGameSelected(game);
                    },
                  );
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class GameItem extends StatelessWidget {
  final Game game;
  final double height;
  final bool isLarge;
  final VoidCallback? onPressed;

  const GameItem({
    Key? key,
    this.isLarge = false,
    required this.game,
    required this.height,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: RawMaterialButton(
        highlightColor: Colors.white.withOpacity(.1),
        focusElevation: 0,
        hoverColor: Colors.black,
        hoverElevation: 1,
        highlightElevation: 0,
        elevation: 0,
        padding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Container(
          height: height * .7,
          width: height * 1.2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(game.image),
              fit: BoxFit.cover,
            ),
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: height * .25,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black,
                      Colors.black,
                      Colors.transparent,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              StylizedText(
                text: Utils.gameName(game.type, context).toUpperCase(),
                fontSize: isLarge ? 50.0 : 35.0,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
