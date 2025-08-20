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
          return CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.7,
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
                      context.read<AudioPlayerCubit>().buttonClickAudio();
                      context
                          .read<CategorySelectionCubit>()
                          .onSelected(category);
                      var selectedGames = games
                          .where(
                            (game) => game.category == category.id,
                          )
                          .toList();
                      if (selectedGames.isNotEmpty) {
                        CartCard.show(
                          context: context,
                          category: category,
                          games: selectedGames,
                        );
                      }
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
