part of 'home_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  Size get size => MediaQuery.of(context).size;
  List<Category> categories = [];
  List<Game> games = [];
  
  @override
  void initState() {
    super.initState();
    context.read<AudioPlayerCubit>().playThemeMusic();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeFetchedState) {
          categories = state.categories;
          games = state.games;
        } else if (state is HomeFailureState) {
          CustomSnackbar.show(context, state.feedback);
        }
      },
      builder: (context, state) {
        var mainStack = Stack(
          children: [
            ResponsiveLayoutBuilder(
              small: (_, Widget? child) => HomeSmall(child: child!),
              medium: (_, Widget? child) => HomeMedium(child: child!),
              large: (_, Widget? child) => child!,
              child: (_) => HomeDetails(
                categories: categories,
                games: games,
              ),
            ),
            const HeaderWidget(),
            ResponsiveLayoutBuilder(
              small: (_, __) => const SizedBox.shrink(),
              medium: (_, __) => const SizedBox.shrink(),
              large: (_, __) => const Align(
                alignment: AppConstants.kFOTopRight,
                child: AudioControl(),
              ),
            ),
            // const Align(
            //   alignment: AppConstants.kFOBottomRight,
            //   child: AnimationToggleButton(),
            // ),
            ResponsiveLayoutBuilder(
              small: (_, __) => const Align(
                alignment: AppConstants.kFOBottomLeft,
                child: InfoButton(),
              ),
              medium: (_, __) => const Align(
                alignment: AppConstants.kFOTopLeft,
                child: InfoButton(),
              ),
              large: (_, __) => const Align(
                alignment: AppConstants.kFOTopLeft,
                child: InfoButton(),
              ),
            ),
          ],
        );
        return SizedBox.fromSize(
          size: size,
          child: state.maybeWhen(
            orElse: () => mainStack,
            failure: (feedback) => EmptyState(
              //title: l10n.habitChooserFailure,
              showRetry: true,
              //onRetry: () => bloc.add(const FetchData()),
            ),
            loading: () => LoadingProgress(),
            fetched: (categories, games) => mainStack,
          ),
        );
      },
    );
  }
}
