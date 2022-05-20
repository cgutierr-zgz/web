import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web/app/app.dart';
import 'package:web/utils/utils.dart';

class App extends StatelessWidget {
  const App({super.key});

  static final _navigator = AppRouter.router();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.theme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: Environment.env.toLowerCase() == 'dev',
      themeMode: context.select((SettingsCubit c) => c.state.themeMode),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerDelegate: _navigator.routerDelegate,
      routeInformationParser: _navigator.routeInformationParser,
    );
  }
}
