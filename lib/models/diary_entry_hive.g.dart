// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_entry.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiaryEntryAdapter extends TypeAdapter<DiaryEntry> {
  @override
  final int typeId = 1;

  @override
  DiaryEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DiaryEntry(
      id: fields[0] as int,
      title: fields[1] as String,
      contentPlainText: fields[2] as String,
      contentDelta: fields[3] as String,
      date: fields[4] as DateTime,
      emotion: fields[5] == null ? Emotion.neutral : fields[5] as Emotion,
    );
  }

  @override
  void write(BinaryWriter writer, DiaryEntry obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.contentPlainText)
      ..writeByte(3)
      ..write(obj.contentDelta)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.emotion);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiaryEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EmotionAdapter extends TypeAdapter<Emotion> {
  @override
  final int typeId = 0;

  @override
  Emotion read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Emotion.joy;
      case 1:
        return Emotion.sad;
      case 2:
        return Emotion.angry;
      case 3:
        return Emotion.surprised;
      case 4:
        return Emotion.fear;
      case 5:
        return Emotion.love;
      case 6:
        return Emotion.neutral;
      default:
        return Emotion.joy;
    }
  }

  @override
  void write(BinaryWriter writer, Emotion obj) {
    switch (obj) {
      case Emotion.joy:
        writer.writeByte(0);
        break;
      case Emotion.sad:
        writer.writeByte(1);
        break;
      case Emotion.angry:
        writer.writeByte(2);
        break;
      case Emotion.surprised:
        writer.writeByte(3);
        break;
      case Emotion.fear:
        writer.writeByte(4);
        break;
      case Emotion.love:
        writer.writeByte(5);
        break;
      case Emotion.neutral:
        writer.writeByte(6);
        break;
    }
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
