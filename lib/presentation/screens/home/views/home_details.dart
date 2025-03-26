part of '../home_screen.dart';

class HomeDetails extends StatefulWidget {
  const HomeDetails({super.key});

  @override
  HomeDetailsState createState() => HomeDetailsState();
}

class HomeDetailsState extends State<HomeDetails> {
  List<Category> categories = [];
  List<Game> games = [];

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
