import 'environment.dart';

void main() => Development();

class Development extends Environment {
  final String appName = "Flutter Starter Dev";
  final String baseUrl = 'https://disease.sh/v3/covid-19/';
  EnvType environmentType = EnvType.DEVELOPMENT;
}
