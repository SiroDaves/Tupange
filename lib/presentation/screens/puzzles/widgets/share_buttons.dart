import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../../data/models/game.dart';
import '../../../widgets/stylized_button.dart';
import '../../../widgets/stylized_container.dart';
import '../../../widgets/stylized_icon.dart';

class ShareButtons extends StatelessWidget {
  final Game game;
  final GlobalKey globalKey;

  const ShareButtons({
    super.key,
    required this.game,
    required this.globalKey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StylizedButton(
          onPressed: () {
            AppUtils.onFacebookTap(game.title!, context);
          },
          child: const StylizedContainer(
            padding: EdgeInsets.all(8.0),
            color: Color(0xffF0F0F0),
            child: Icon(
              FontAwesomeIcons.facebook,
              size: 22.0,
              color: Color(0xff3b5998),
            ),
          ),
        ),

        // twitter
        StylizedButton(
          onPressed: () {
            AppUtils.onTwitterTap(game.title!, context);
          },
          child: const StylizedContainer(
            padding: EdgeInsets.all(8.0),
            color: Color(0xffF0F0F0),
            child: Icon(
              FontAwesomeIcons.twitter,
              size: 22.0,
              color: Color(0xff00acee),
            ),
          ),
        ),

        // download
        StylizedButton(
          onPressed: () async {
            final bytes = await AppUtils.capturePng(globalKey);
            AppUtils.onDownloadTap(bytes);
          },
          child: const StylizedContainer(
            padding: EdgeInsets.all(8.0),
            color: Color(0xffF0F0F0),
            child: Icon(
              FontAwesomeIcons.download,
              size: 22.0,
            ),
          ),
        ),
      ],
    );
  }
}

class ScoreTile extends StatelessWidget {
  final IconData icon;
  final String text;

  const ScoreTile({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // icon
        Expanded(
          child: Icon(
            icon,
            size: 24.0,
            color: Colors.white,
          ),
        ),

        // text
        Expanded(
          flex: 4,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24.0,
              color: Colors.white,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

class WinStarWidget extends StatelessWidget {
  static const maxStar = 5;
  final int star;

  const WinStarWidget({super.key, this.star = 5});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List<Widget>.generate(maxStar, (index) {
        return StylizedIcon(
          size: 32.0,
          icon: FontAwesomeIcons.star,
          color: index >= star ? Colors.white.withValues(alpha: 0.20) : Colors.white,
        );
      }).toList(),
    );
  }
}