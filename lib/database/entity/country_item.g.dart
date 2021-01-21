// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountryItemAdapter extends TypeAdapter<CountryItem> {
  @override
  final int typeId = 2;

  @override
  CountryItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CountryItem(
      updated: fields[0] as int,
      country: fields[1] as String,
      countryInfo: fields[2] as CountryInfo,
      cases: fields[3] as int,
      todayCases: fields[4] as int,
      deaths: fields[5] as int,
      todayDeaths: fields[6] as int,
      recovered: fields[7] as int,
      todayRecovered: fields[8] as int,
      active: fields[9] as int,
      critical: fields[10] as int,
      casesPerOneMillion: fields[11] as int,
      deathsPerOneMillion: fields[12] as double,
      tests: fields[13] as int,
      testsPerOneMillion: fields[14] as double,
      population: fields[15] as int,
      continent: fields[16] as String,
      oneCasePerPeople: fields[17] as int,
      oneDeathPerPeople: fields[18] as int,
      oneTestPerPeople: fields[19] as int,
      activePerOneMillion: fields[20] as double,
      recoveredPerOneMillion: fields[21] as double,
      criticalPerOneMillion: fields[22] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CountryItem obj) {
    writer
      ..writeByte(23)
      ..writeByte(0)
      ..write(obj.updated)
      ..writeByte(1)
      ..write(obj.country)
      ..writeByte(2)
      ..write(obj.countryInfo)
      ..writeByte(3)
      ..write(obj.cases)
      ..writeByte(4)
      ..write(obj.todayCases)
      ..writeByte(5)
      ..write(obj.deaths)
      ..writeByte(6)
      ..write(obj.todayDeaths)
      ..writeByte(7)
      ..write(obj.recovered)
      ..writeByte(8)
      ..write(obj.todayRecovered)
      ..writeByte(9)
      ..write(obj.active)
      ..writeByte(10)
      ..write(obj.critical)
      ..writeByte(11)
      ..write(obj.casesPerOneMillion)
      ..writeByte(12)
      ..write(obj.deathsPerOneMillion)
      ..writeByte(13)
      ..write(obj.tests)
      ..writeByte(14)
      ..write(obj.testsPerOneMillion)
      ..writeByte(15)
      ..write(obj.population)
      ..writeByte(16)
      ..write(obj.continent)
      ..writeByte(17)
      ..write(obj.oneCasePerPeople)
      ..writeByte(18)
      ..write(obj.oneDeathPerPeople)
      ..writeByte(19)
      ..write(obj.oneTestPerPeople)
      ..writeByte(20)
      ..write(obj.activePerOneMillion)
      ..writeByte(21)
      ..write(obj.recoveredPerOneMillion)
      ..writeByte(22)
      ..write(obj.criticalPerOneMillion);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
