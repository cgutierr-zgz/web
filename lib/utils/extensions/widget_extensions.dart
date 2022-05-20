import 'package:flutter/material.dart';

extension JoinedWidgets on List<Widget> {
  List<Widget> joinWithSeparator(Widget separator) {
    return length > 1
        ? (take(length - 1)
            .map((widget) => [widget, separator])
            .expand((widget) => widget)
            .toList()
          ..add(last))
        : this;
  }
}
