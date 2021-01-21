import 'dart:convert';

import 'package:hive/hive.dart';

import 'country_item.dart';

part 'all_country.g.dart';

@HiveType(typeId: 1)
class AllCountryModel {
  @HiveField(0)
  final List<CountryItem> countries;

  AllCountryModel({this.countries});

  factory AllCountryModel.fromRawJson(String str) =>
      AllCountryModel.fromJson(json.decode(str) as List<dynamic>);

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "Countries": countries == null
            ? null
            : List<dynamic>.from(countries.map((x) => x.toJson())),
      };

  factory AllCountryModel.fromJson(List<dynamic> json) => AllCountryModel(
        countries: json
            ?.map((e) => e == null
                ? null
                : CountryItem.fromJson(e as Map<String, dynamic>))
            ?.toList(),
      );
}
