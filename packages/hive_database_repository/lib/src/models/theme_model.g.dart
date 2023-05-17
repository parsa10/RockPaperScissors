// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemeModelAdapter extends TypeAdapter<ThemeModel> {
  @override
  final int typeId = 1;

  @override
  ThemeModel read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ThemeModel.system;
      case 1:
        return ThemeModel.light;
      case 2:
        return ThemeModel.dark;
      default:
        return ThemeModel.system;
    }
  }

  @override
  void write(BinaryWriter writer, ThemeModel obj) {
    switch (obj) {
      case ThemeModel.system:
        writer.writeByte(0);
        break;
      case ThemeModel.light:
        writer.writeByte(1);
        break;
      case ThemeModel.dark:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
