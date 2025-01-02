part of 'home_screen.dart';

class HomeSmall extends StatelessWidget {
  final Widget child;

  const HomeSmall({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class HomeMedium extends StatelessWidget {
  final Widget child;

  const HomeMedium({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class HomeDetails extends StatelessWidget {
  final List<Category> categories;
  final List<Game> games;

  const HomeDetails({super.key, required this.categories, required this.games});

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
              items: categories.map((category) {
                return Builder(
                  builder: (BuildContext ctx) {
                    return MenuCarousel(
                      category: category,
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

class AnimationToggleButton extends StatelessWidget {
  const AnimationToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final state =
        context.select((GameSelectionHelperCubit cubit) => cubit.state);

    final bool isPaused = state.isPaused;

    return StylizedButton(
      onPressed: () {
        context.read<GameSelectionHelperCubit>().onPlanetMovementToggle();
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
