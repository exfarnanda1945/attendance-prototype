// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_exit_detail_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttendanceExitDetailModelAdapter
    extends TypeAdapter<AttendanceExitDetailModel> {
  @override
  final int typeId = 4;

  @override
  AttendanceExitDetailModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttendanceExitDetailModel(
      location: fields[0] as LocationDetailModel?,
      network: fields[1] as NetworkDetailModel?,
      time: fields[3] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, AttendanceExitDetailModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.location)
      ..writeByte(1)
      ..write(obj.network)
      ..writeByte(3)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttendanceExitDetailModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
