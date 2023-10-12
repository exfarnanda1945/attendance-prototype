// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_detail_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NetworkDetailModelAdapter extends TypeAdapter<NetworkDetailModel> {
  @override
  final int typeId = 6;

  @override
  NetworkDetailModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NetworkDetailModel(
      name: fields[0] as String,
      ip: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NetworkDetailModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.ip);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NetworkDetailModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
