part of '../home_screen.dart';

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
