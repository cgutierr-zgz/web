import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web/app/app.dart';
import 'package:web/error/error.dart';
import 'package:web/utils/utils.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    this.exception,
  });

  final Exception? exception;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.primaryColor;
    final l10n = context.l10n;

    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                VerticalSpacer.xxLarge(),
                Text(
                  l10n.unkownPageMessage,
                  style: TextStyle(color: color),
                ),
                TextButton(
                  style: TextButton.styleFrom(primary: color),
                  child: Text(l10n.goBackHome),
                  onPressed: () => context.goNamed(AppRoutes.home.routeName),
                )
              ].joinWithSeparator(VerticalSpacer.medium20()),
            ),
            const ErrorCheese(),
          ],
        ),
      ),
    );
  }
}

class ErrorCheese extends StatelessWidget {
  const ErrorCheese({super.key});

  static const _size = 60.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final color = theme.primaryColor;

    return Stack(
      alignment: Alignment.center,
      children: [
        DragBox(
          initPos: Offset(
            (size.width / 2) - (_size / 2),
            (size.height / 2) - (_size / 2),
          ),
          child: SizedBox(
            height: _size,
            width: _size,
            child: Assets.images.logo.svg(color: color),
          ),
        ),
      ],
    );
  }
}
