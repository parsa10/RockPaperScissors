import 'package:hive_flutter/hive_flutter.dart';

part 'theme_model.g.dart';

@HiveType(typeId: 1)
enum ThemeModel {
  @HiveField(0)
  system,
  @HiveField(1)
  light,
  @HiveField(2)
  dark,
}
