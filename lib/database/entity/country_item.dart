import 'dart:convert';

import 'package:hive/hive.dart';

import 'country_info.dart';

part 'country_item.g.dart';

@HiveType(typeId: 2)
class CountryItem {
  @HiveField(0)
  final int updated;
  @HiveField(1)
  final String country;
  @HiveField(2)
  final CountryInfo countryInfo;
  @HiveField(3)
  final int cases;
  @HiveField(4)
  final int todayCases;
  @HiveField(5)
  final int deaths;
  @HiveField(6)
  final int todayDeaths;
  @HiveField(7)
  final int recovered;
  @HiveField(8)
  final int todayRecovered;
  @HiveField(9)
  final int active;
  @HiveField(10)
  final int critical;
  @HiveField(11)
  final int casesPerOneMillion;
  @HiveField(12)
  final double deathsPerOneMillion;
  @HiveField(13)
  final int tests;
  @HiveField(14)
  final double testsPerOneMillion;
  @HiveField(15)
  final int population;
  @HiveField(16)
  final String continent;
  @HiveField(17)
  final int oneCasePerPeople;
  @HiveField(18)
  final int oneDeathPerPeople;
  @HiveField(19)
  final int oneTestPerPeople;
  @HiveField(20)
  final double activePerOneMillion;
  @HiveField(21)
  final double recoveredPerOneMillion;
  @HiveField(22)
  final double criticalPerOneMillion;

  CountryItem(
      {this.updated,
      this.country,
      this.countryInfo,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.todayRecovered,
      this.active,
      this.critical,
      this.casesPerOneMillion,
      this.deathsPerOneMillion,
      this.tests,
      this.testsPerOneMillion,
      this.population,
      this.continent,
      this.oneCasePerPeople,
      this.oneDeathPerPeople,
      this.oneTestPerPeople,
      this.activePerOneMillion,
      this.recoveredPerOneMillion,
      this.criticalPerOneMillion});

  factory CountryItem.fromRawJson(String str) =>
      CountryItem.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory CountryItem.fromJson(Map<String, dynamic> json) => CountryItem(
        updated: json['updated'] as int,
        country: json['country'] as String,
        countryInfo: json['countryInfo'] == null
            ? null
            : CountryInfo.fromJson(json['countryInfo'] as Map<String, dynamic>),
        cases: json['cases'] as int,
        todayCases: json['todayCases'] as int,
        deaths: json['deaths'] as int,
        todayDeaths: json['todayDeaths'] as int,
        recovered: json['recovered'] as int,
        todayRecovered: json['todayRecovered'] as int,
        active: json['active'] as int,
        critical: json['critical'] as int,
        casesPerOneMillion: json['casesPerOneMillion'] as int,
        deathsPerOneMillion: (json['deathsPerOneMillion'] as num).toDouble(),
        tests: json['tests'] as int,
        testsPerOneMillion: (json['testsPerOneMillion'] as num).toDouble(),
        population: json['population'] as int,
        continent: json['continent'] as String,
        oneCasePerPeople: json['oneCasePerPeople'] as int,
        oneDeathPerPeople: json['oneDeathPerPeople'] as int,
        oneTestPerPeople: json['oneTestPerPeople'] as int,
        activePerOneMillion: (json['activePerOneMillion'] as num)?.toDouble(),
        recoveredPerOneMillion:
            (json['recoveredPerOneMillion'] as num)?.toDouble(),
        criticalPerOneMillion:
            (json['criticalPerOneMillion'] as num)?.toDouble(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'updated': updated == null ? null : updated,
        'country': country == null ? null : country,
        'countryInfo': countryInfo == null ? null : countryInfo,
        'cases': cases == null ? null : cases,
        'todayCases': todayCases == null ? null : todayCases,
        'deaths': deaths == null ? null : deaths,
        'todayDeaths': todayDeaths == null ? null : todayDeaths,
        'recovered': recovered == null ? null : recovered,
        'todayRecovered': todayRecovered == null ? null : todayRecovered,
        'active': active == null ? null : active,
        'critical': critical == null ? null : critical,
        'casesPerOneMillion':
            casesPerOneMillion == null ? null : casesPerOneMillion,
        'deathsPerOneMillion':
            deathsPerOneMillion == null ? null : deathsPerOneMillion,
        'tests': tests == null ? null : tests,
        'testsPerOneMillion':
            testsPerOneMillion == null ? null : testsPerOneMillion,
        'population': population == null ? null : population,
        'continent': continent == null ? null : continent,
        'oneCasePerPeople': oneCasePerPeople == null ? null : oneCasePerPeople,
        'oneDeathPerPeople':
            oneDeathPerPeople == null ? null : oneDeathPerPeople,
        'oneTestPerPeople': oneTestPerPeople == null ? null : oneTestPerPeople,
        'activePerOneMillion':
            activePerOneMillion == null ? null : activePerOneMillion,
        'recoveredPerOneMillion':
            recoveredPerOneMillion == null ? null : recoveredPerOneMillion,
        'criticalPerOneMillion':
            criticalPerOneMillion == null ? null : criticalPerOneMillion,
      };
}
