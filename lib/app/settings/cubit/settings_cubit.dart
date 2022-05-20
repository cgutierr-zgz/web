import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:web/app/app.dart';
import 'package:web/utils/utils.dart';

class SettingsCubit extends HydratedCubit<Settings> {
  SettingsCubit() : super(const Settings(themeMode: ThemeMode.light));

  ThemeMode get _currentTheme =>
      state.themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;

  void updateTheme() => emit(Settings(themeMode: _currentTheme));

  @override
  Settings? fromJson(Json json) => Settings.fromJson(json);

  @override
  Json? toJson(Settings state) => state.toJson();
}
