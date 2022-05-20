import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web/app/app.dart';
import 'package:web/error/error.dart';

abstract class AppRouter {
  static GoRouter router() {
    return GoRouter(
      routes: [
        GoRoute(
          path: AppRoutes.home.path,
          name: AppRoutes.home.name,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: AppRoutes.home.view,
          ),
        ),
      ],
      errorPageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: ErrorPage(exception: state.error),
      ),
    );
  }
}
