// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emotion.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmotionAdapter extends TypeAdapter<Emotion> {
  @override
  final int typeId = 1;

  @override
  Emotion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Emotion(
      name: fields[0] as String,
      color: fields[1] as String,
      assetPath: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Emotion obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.color)
      ..writeByte(2)
      ..write(obj.assetPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmotionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EmotionEnumAdapter extends TypeAdapter<EmotionEnum> {
  @override
  final int typeId = 0;

  @override
  EmotionEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return EmotionEnum.joy;
      case 1:
        return EmotionEnum.sad;
      case 2:
        return EmotionEnum.anger;
      case 3:
        return EmotionEnum.surprise;
      case 4:
        return EmotionEnum.fear;
      case 5:
        return EmotionEnum.love;
      case 6:
        return EmotionEnum.neutral;
      default:
        return EmotionEnum.joy;
    }
  }

  @override
  void write(BinaryWriter writer, EmotionEnum obj) {
    switch (obj) {
      case EmotionEnum.joy:
        writer.writeByte(0);
        break;
      case EmotionEnum.sad:
        writer.writeByte(1);
        break;
      case EmotionEnum.anger:
        writer.writeByte(2);
        break;
      case EmotionEnum.surprise:
        writer.writeByte(3);
        break;
      case EmotionEnum.fear:
        writer.writeByte(4);
        break;
      case EmotionEnum.love:
        writer.writeByte(5);
        break;
      case EmotionEnum.neutral:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmotionEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
