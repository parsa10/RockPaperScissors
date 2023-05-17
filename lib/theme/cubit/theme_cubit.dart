import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_database_repository/hive_database_repository.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit({required this.hiveDatabaseRepository}) : super(ThemeMode.system);

  final HiveDatabaseRepository hiveDatabaseRepository;

  void getTheme() {
    switch (hiveDatabaseRepository.getThemeModel()) {
      case ThemeModel.system:
        emit(ThemeMode.system);
        break;
      case ThemeModel.light:
        emit(ThemeMode.light);
        break;
      case ThemeModel.dark:
        emit(ThemeMode.dark);
        break;
      default:
        emit(ThemeMode.system);
        break;
    }
  }

  void toggleTheme(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.system:
        hiveDatabaseRepository.setThemeModel(ThemeModel.system);
        break;
      case ThemeMode.light:
        hiveDatabaseRepository.setThemeModel(ThemeModel.light);
        break;
      case ThemeMode.dark:
        hiveDatabaseRepository.setThemeModel(ThemeModel.dark);
        break;
    }
    emit(themeMode);
  }
}
