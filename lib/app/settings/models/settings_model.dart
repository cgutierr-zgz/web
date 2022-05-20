import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:web/utils/utils.dart';

part 'settings_model.g.dart';

@JsonSerializable()
class Settings extends Equatable {
  const Settings({required this.themeMode});

  factory Settings.fromJson(Json data) => _$SettingsFromJson(data);

  final ThemeMode themeMode;

  @override
  List<Object?> get props => [themeMode];

  Json toJson() => _$SettingsToJson(this);

  Settings copyWith({ThemeMode? themeMode}) {
    return Settings(
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
