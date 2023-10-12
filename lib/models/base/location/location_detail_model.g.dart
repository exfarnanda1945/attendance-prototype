// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_detail_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocationDetailModelAdapter extends TypeAdapter<LocationDetailModel> {
  @override
  final int typeId = 5;

  @override
  LocationDetailModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocationDetailModel(
      lat: fields[0] as double,
      long: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, LocationDetailModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.long);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationDetailModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
