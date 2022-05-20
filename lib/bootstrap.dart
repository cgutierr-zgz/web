import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:web/app/app.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      GoRouter.setUrlPathStrategy(UrlPathStrategy.path);

      await BlocOverrides.runZoned(
        () async => _setupHydratedBloc(await builder()),
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

Future<void> _setupHydratedBloc(Widget child) async {
  final storage = await HydratedStorage.build(
    storageDirectory: HydratedStorage.webStorageDirectory,
  );

  return HydratedBlocOverrides.runZoned(
    () async => runApp(BlocProviders(child: child)),
    storage: storage,
    blocObserver: AppBlocObserver(),
  );
}

class BlocProviders extends MultiBlocProvider {
  BlocProviders({
    super.key,
    required super.child,
  }) : super(
          providers: [
            BlocProvider<SettingsCubit>(
              lazy: false,
              create: (context) => SettingsCubit(),
            ),
          ],
        );
}
