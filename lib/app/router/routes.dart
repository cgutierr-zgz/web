import 'package:flutter/material.dart';
import 'package:web/home/home.dart';

enum AppRoutes {
  home('/', 'HOME', HomePage());

  const AppRoutes(this.path, this.routeName, this.view);

  final String path;
  final String routeName;
  final Widget view;

  @override
  String toString() => '$name: [$path][$routeName][$view]';
}
