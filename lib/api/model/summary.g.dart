// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Summary _$SummaryFromJson(Map<String, dynamic> json) {
  return Summary(
    updated: json['updated'] as int,
    cases: json['cases'] as int,
    todayCases: json['todayCases'] as int,
    deaths: json['deaths'] as int,
    todayDeaths: json['todayDeaths'] as int,
    recovered: json['recovered'] as int,
    todayRecovered: json['todayRecovered'] as int,
    active: json['active'] as int,
    critical: json['critical'] as int,
    casesPerOneMillion: json['casesPerOneMillion'] as int,
    deathsPerOneMillion: (json['deathsPerOneMillion'] as num)?.toDouble(),
    tests: json['tests'] as int,
    testsPerOneMillion: (json['testsPerOneMillion'] as num)?.toDouble(),
    population: json['population'] as int,
    oneCasePerPeople: json['oneCasePerPeople'] as int,
    oneDeathPerPeople: json['oneDeathPerPeople'] as int,
    oneTestPerPeople: json['oneTestPerPeople'] as int,
    activePerOneMillion: (json['activePerOneMillion'] as num)?.toDouble(),
    recoveredPerOneMillion: (json['recoveredPerOneMillion'] as num)?.toDouble(),
    criticalPerOneMillion: (json['criticalPerOneMillion'] as num)?.toDouble(),
    affectedCountries: json['affectedCountries'] as int,
  );
}

Map<String, dynamic> _$SummaryToJson(Summary instance) => <String, dynamic>{
      'updated': instance.updated,
      'cases': instance.cases,
      'todayCases': instance.todayCases,
      'deaths': instance.deaths,
      'todayDeaths': instance.todayDeaths,
      'recovered': instance.recovered,
      'todayRecovered': instance.todayRecovered,
      'active': instance.active,
      'critical': instance.critical,
      'casesPerOneMillion': instance.casesPerOneMillion,
      'deathsPerOneMillion': instance.deathsPerOneMillion,
      'tests': instance.tests,
      'testsPerOneMillion': instance.testsPerOneMillion,
      'population': instance.population,
      'oneCasePerPeople': instance.oneCasePerPeople,
      'oneDeathPerPeople': instance.oneDeathPerPeople,
      'oneTestPerPeople': instance.oneTestPerPeople,
      'activePerOneMillion': instance.activePerOneMillion,
      'recoveredPerOneMillion': instance.recoveredPerOneMillion,
      'criticalPerOneMillion': instance.criticalPerOneMillion,
      'affectedCountries': instance.affectedCountries,
    };
