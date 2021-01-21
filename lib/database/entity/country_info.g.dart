// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountryInfoAdapter extends TypeAdapter<CountryInfo> {
  @override
  final int typeId = 3;

  @override
  CountryInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CountryInfo(
      id: fields[0] as int,
      iso2: fields[1] as String,
      iso3: fields[2] as String,
      lat: fields[3] as double,
      long: fields[4] as double,
      flag: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CountryInfo obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.iso2)
      ..writeByte(2)
      ..write(obj.iso3)
      ..writeByte(3)
      ..write(obj.lat)
      ..writeByte(4)
      ..write(obj.long)
      ..writeByte(5)
      ..write(obj.flag);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
