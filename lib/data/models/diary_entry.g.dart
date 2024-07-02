// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_entry.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiaryEntryAdapter extends TypeAdapter<DiaryEntry> {
  @override
  final int typeId = 2;

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
      emotion: fields[5] as Emotion,
      activities: fields[6] == null
          ? ['...', '...', '...']
          : (fields[6] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, DiaryEntry obj) {
    writer
      ..writeByte(7)
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
      ..write(obj.emotion)
      ..writeByte(6)
      ..write(obj.activities);
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
