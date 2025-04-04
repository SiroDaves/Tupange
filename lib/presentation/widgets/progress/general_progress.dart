import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/resource/app_assets.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: CircularProgressIndicator(
          //color: ThemeColors.primary,
          strokeWidth: 5,
          backgroundColor: Colors.white.withValues(alpha: 0.3),
        ),
      ),
    );
  }
}

class SmallCircularProgress extends StatelessWidget {
  const SmallCircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: CircularProgressIndicator(
        //color: ThemeColors.primary,
        strokeWidth: 3,
        backgroundColor: Colors.white.withValues(alpha: 0.3),
      ),
    );
  }
}

class EmptyState extends StatelessWidget {
  final String title;
  final String titleRetry;
  final bool showRetry;
  final VoidCallback? onRetry;
  const EmptyState({
    super.key,
    this.title =
        'Sorry, no data is available at the moment. Please check back later.',
    this.titleRetry = 'RETRY',
    this.showRetry = false,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.imgZeroState,
          height: 160,
          width: 160,
        ),
        /*Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyles.bodyStyle1.size(16).textHeight(1.2),
        ).center().padding(all: Sizes.l),
        const SizedBox(height: Sizes.l),*/
        /*if (showRetry) ...[
          [
            AppButton(
              label: titleRetry,
              onPressed: onRetry,
              bgColor: Colors.white,
              foreColor: ThemeColors.primary,
              hoverColor: ThemeColors.primary,
              border: Border.all(width: 2, color: ThemeColors.primary),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ).expanded(),
          ].toRow().padding(all: Sizes.l),
        ]*/
      ],
    );
  }
}

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(strokeWidth: 1.5),
      ),
    );
  }
}

class LoadingProgress extends StatelessWidget {
  final String title;
  const LoadingProgress({
    super.key,
    this.title = 'Processing data ...',
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    const loadingIndicator1 = LoadingIndicator(
      indicatorType: Indicator.lineScalePulseOut,
      colors: [
        Colors.red,
        Colors.orange,
        Colors.yellow,
        Colors.green,
        Colors.blue,
        Colors.indigo,
        Colors.purple,
        Color(0xFFFF00FF),
      ],
      pathBackgroundColor: Colors.black,
    );
    return Center(
      child: SizedBox(
        height: size.height / 2.5,
        child: Column(
          children: [
            SizedBox(
              height: size.height / 5,
              child: loadingIndicator1,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              //style: TextStyles.titleStyle1.size(16),
            ).padding(all: 30),
          ],
        ),
      ),
    );
  }
}
