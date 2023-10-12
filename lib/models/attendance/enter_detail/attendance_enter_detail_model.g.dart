// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_enter_detail_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttendanceEnterDetailModelAdapter
    extends TypeAdapter<AttendanceEnterDetailModel> {
  @override
  final int typeId = 3;

  @override
  AttendanceEnterDetailModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttendanceEnterDetailModel(
      location: fields[0] as LocationDetailModel,
      network: fields[1] as NetworkDetailModel,
      time: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, AttendanceEnterDetailModel obj) {
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
      other is AttendanceEnterDetailModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
