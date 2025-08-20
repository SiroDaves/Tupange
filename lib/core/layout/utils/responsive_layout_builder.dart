import 'package:flutter/material.dart';
import 'app_breakpoints.dart';

/// Represents the layout size passed to [ResponsiveLayoutBuilder.child].
enum ResponsiveLayoutSize { small, medium, large, xlarge }

/// Signature for the individual builders (`small`, `medium`, `large`, `xlarge`).
typedef ResponsiveLayoutWidgetBuilder = Widget Function(BuildContext, Widget?);

class ResponsiveLayoutBuilder extends StatelessWidget {
  const ResponsiveLayoutBuilder({
    super.key,
    required this.small,
    required this.medium,
    required this.large,
    this.child,
  });

  /// [ResponsiveLayoutWidgetBuilder] for small layout.
  final ResponsiveLayoutWidgetBuilder small;

  /// [ResponsiveLayoutWidgetBuilder] for medium layout.
  final ResponsiveLayoutWidgetBuilder medium;

  /// [ResponsiveLayoutWidgetBuilder] for large layout.
  final ResponsiveLayoutWidgetBuilder large;

  final Widget Function(ResponsiveLayoutSize currentSize)? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;

        if (screenWidth <= AppBreakpoints.small) {
          return small(context, child?.call(ResponsiveLayoutSize.small));
        }

        if (screenWidth <= AppBreakpoints.medium) {
          return medium(context, child?.call(ResponsiveLayoutSize.medium));
        }

        if (screenWidth <= AppBreakpoints.large) {
          return large(context, child?.call(ResponsiveLayoutSize.large));
        }

        return large(context, child?.call(ResponsiveLayoutSize.large));
      },
    );
  }
}
