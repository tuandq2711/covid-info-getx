import 'environment.dart';

void main() => Production();

class Production extends Environment {
  final String appName = "Flutter Starter";
  final String baseUrl = 'https://disease.sh/v3/covid-19/';
  EnvType environmentType = EnvType.PRODUCTION;
}
