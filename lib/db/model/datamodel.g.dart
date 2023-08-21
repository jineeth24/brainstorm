// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datamodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      username: fields[0] as String,
      password: fields[1] as String,
      dartscore: (fields[4] as List).cast<dynamic>(),
      flutterscore: (fields[5] as List).cast<dynamic>(),
      attempt: fields[2] as int,
      userid: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.password)
      ..writeByte(2)
      ..write(obj.attempt)
      ..writeByte(3)
      ..write(obj.userid)
      ..writeByte(4)
      ..write(obj.dartscore)
      ..writeByte(5)
      ..write(obj.flutterscore);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ScoreModelAdapter extends TypeAdapter<ScoreModel> {
  @override
  final int typeId = 2;

  @override
  ScoreModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScoreModel(
      userid: fields[0] as int?,
      category: fields[1] as String,
      dartscore: (fields[2] as List).cast<dynamic>(),
      flutterscore: (fields[3] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, ScoreModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.userid)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.dartscore)
      ..writeByte(3)
      ..write(obj.flutterscore);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScoreModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class QuizmodelAdapter extends TypeAdapter<Quizmodel> {
  @override
  final int typeId = 1;

  @override
  Quizmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Quizmodel(
      primarykey: fields[8] as int?,
      category: fields[0] as String,
      level: fields[1] as int,
      question: fields[2] as String,
      optionA: fields[3] as String,
      optionB: fields[4] as String,
      optionC: fields[5] as String,
      optionD: fields[6] as String,
      answer: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Quizmodel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.level)
      ..writeByte(2)
      ..write(obj.question)
      ..writeByte(3)
      ..write(obj.optionA)
      ..writeByte(4)
      ..write(obj.optionB)
      ..writeByte(5)
      ..write(obj.optionC)
      ..writeByte(6)
      ..write(obj.optionD)
      ..writeByte(7)
      ..write(obj.answer)
      ..writeByte(8)
      ..write(obj.primarykey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuizmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
