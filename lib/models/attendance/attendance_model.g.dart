// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttendanceModelAdapter extends TypeAdapter<AttendanceModel> {
  @override
  final int typeId = 2;

  @override
  AttendanceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttendanceModel(
      id: fields[0] as String,
      userId: fields[1] as String,
      enter: fields[2] as DateTime,
      enterLatitude: fields[4] as double,
      enterLongitude: fields[5] as double,
      enterNetworkName: fields[6] as String,
      enterNetworkIp: fields[7] as String,
      exit: fields[3] as DateTime?,
      exitLatitude: fields[8] as double?,
      exitLongitude: fields[9] as double?,
      exitNetworkIp: fields[11] as String?,
      exitNetworkName: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AttendanceModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.enter)
      ..writeByte(3)
      ..write(obj.exit)
      ..writeByte(4)
      ..write(obj.enterLatitude)
      ..writeByte(5)
      ..write(obj.enterLongitude)
      ..writeByte(6)
      ..write(obj.enterNetworkName)
      ..writeByte(7)
      ..write(obj.enterNetworkIp)
      ..writeByte(8)
      ..write(obj.exitLatitude)
      ..writeByte(9)
      ..write(obj.exitLongitude)
      ..writeByte(10)
      ..write(obj.exitNetworkName)
      ..writeByte(11)
      ..write(obj.exitNetworkIp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttendanceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
