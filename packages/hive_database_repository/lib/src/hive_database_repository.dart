import 'package:hive_database_repository/hive_database_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabaseRepository {
  const HiveDatabaseRepository();

  static const _themeModel = 'themeMode';
  static const _appBox = 'appBox';

  Future<void> initHive() async {
    await Hive.initFlutter();
    Hive
      ..registerAdapter(ThemeModelAdapter());
    await Hive.openBox(_appBox);
  }


  ThemeModel? getThemeModel() {
    ThemeModel? themeMode = Hive.box(_appBox).get(_themeModel);
    // print(themeMode);
    return themeMode;
  }

  void setThemeModel(ThemeModel themeMode) {
    Hive.box(_appBox).put(_themeModel, themeMode);
  }

}
