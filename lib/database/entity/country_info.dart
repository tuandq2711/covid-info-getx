import 'dart:convert';

import 'package:hive/hive.dart';

part 'country_info.g.dart';

@HiveType(typeId: 3)
class CountryInfo {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String iso2;
  @HiveField(2)
  final String iso3;
  @HiveField(3)
  final double lat;
  @HiveField(4)
  final double long;
  @HiveField(5)
  final String flag;

  CountryInfo({this.id, this.iso2, this.iso3, this.lat, this.long, this.flag});

  factory CountryInfo.fromRawJson(String str) =>
      CountryInfo.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory CountryInfo.fromJson(Map<String, dynamic> json) => CountryInfo(
        id: json['id'] as int,
        iso2: json['iso2'] as String,
        iso3: json['iso3'] as String,
        lat: (json['lat'] as num).toDouble(),
        long: (json['long'] as num).toDouble(),
        flag: json['flag'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id == null ? null : id,
        'iso2': iso2 == null ? null : iso2,
        'iso3': iso3 == null ? null : iso3,
        'lat': lat == null ? null : lat,
        'long': long == null ? null : long,
        'flag': flag == null ? null : flag,
      };
}
