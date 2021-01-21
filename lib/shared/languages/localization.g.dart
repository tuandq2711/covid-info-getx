// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization.dart';

// **************************************************************************
// SheetLocalizationGenerator
// **************************************************************************

// ignore_for_file: camel_case_types

class AppLocalizations {
  AppLocalizations(this.locale) : labels = languages[locale];

  final Locale locale;

  static final Map<Locale, AppLocalizations_Labels> languages = {
    Locale.fromSubtags(languageCode: 'en'): AppLocalizations_Labels(
      title: AppLocalizations_Labels_Title(
        home: 'CoronaVirus',
        country: 'Corona By Country',
        detailCountry: 'Detail',
      ),
      app: AppLocalizations_Labels_App(
        title: 'Corona Tracking',
      ),
      string: AppLocalizations_Labels_String(
        totalConfirmed: 'Total confirmed',
        totalDeaths: 'Total deaths',
        totalRecovery: 'Total recovery',
        totalInfected: 'Total Infected',
        search: 'Search',
      ),
      btn: AppLocalizations_Labels_Btn(
        fetchCountry: 'Fetch by country',
      ),
      error: AppLocalizations_Labels_Error(
        connectionFail: 'Error on connection :(',
      ),
    ),
    Locale.fromSubtags(languageCode: 'ja'): AppLocalizations_Labels(
      title: AppLocalizations_Labels_Title(
        home: 'コロナウイルス',
        country: 'コロナカントリー',
        detailCountry: 'ディテール',
      ),
      app: AppLocalizations_Labels_App(
        title: 'コロナの追跡',
      ),
      string: AppLocalizations_Labels_String(
        totalConfirmed: '合計確認しました',
        totalDeaths: '総死亡',
        totalRecovery: '総回収',
        totalInfected: '感染の合計',
        search: '探す',
      ),
      btn: AppLocalizations_Labels_Btn(
        fetchCountry: '国によってフェッチ',
      ),
      error: AppLocalizations_Labels_Error(
        connectionFail: '接続のエラー:(',
      ),
    ),
    Locale.fromSubtags(languageCode: 'vi'): AppLocalizations_Labels(
      title: AppLocalizations_Labels_Title(
        home: 'CoronaVirus',
        country: 'Corona theo quốc gia',
        detailCountry: 'Chi tiết',
      ),
      app: AppLocalizations_Labels_App(
        title: 'Corona Tracking',
      ),
      string: AppLocalizations_Labels_String(
        totalConfirmed: 'Tổng số xác nhận',
        totalDeaths: 'Tổng số trường hợp tử vong',
        totalRecovery: 'Tổng số phục hồi',
        totalInfected: 'Tổng số nhiễm',
        search: 'Tìm kiếm',
      ),
      btn: AppLocalizations_Labels_Btn(
        fetchCountry: 'Tìm theo quốc gia',
      ),
      error: AppLocalizations_Labels_Error(
        connectionFail: 'Lỗi kết nối :(',
      ),
    ),
  };

  final AppLocalizations_Labels labels;

  static AppLocalizations_Labels of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations)?.labels;
}

class AppLocalizations_Labels_Title {
  const AppLocalizations_Labels_Title(
      {this.home, this.country, this.detailCountry});

  final String home;

  final String country;

  final String detailCountry;

  String getByKey(String key) {
    switch (key) {
      case 'home':
        return home;
      case 'country':
        return country;
      case 'detailCountry':
        return detailCountry;
      default:
        return '';
    }
  }
}

class AppLocalizations_Labels_App {
  const AppLocalizations_Labels_App({this.title});

  final String title;

  String getByKey(String key) {
    switch (key) {
      case 'title':
        return title;
      default:
        return '';
    }
  }
}

class AppLocalizations_Labels_String {
  const AppLocalizations_Labels_String(
      {this.totalConfirmed,
      this.totalDeaths,
      this.totalRecovery,
      this.totalInfected,
      this.search});

  final String totalConfirmed;

  final String totalDeaths;

  final String totalRecovery;

  final String totalInfected;

  final String search;

  String getByKey(String key) {
    switch (key) {
      case 'totalConfirmed':
        return totalConfirmed;
      case 'totalDeaths':
        return totalDeaths;
      case 'totalRecovery':
        return totalRecovery;
      case 'totalInfected':
        return totalInfected;
      case 'search':
        return search;
      default:
        return '';
    }
  }
}

class AppLocalizations_Labels_Btn {
  const AppLocalizations_Labels_Btn({this.fetchCountry});

  final String fetchCountry;

  String getByKey(String key) {
    switch (key) {
      case 'fetchCountry':
        return fetchCountry;
      default:
        return '';
    }
  }
}

class AppLocalizations_Labels_Error {
  const AppLocalizations_Labels_Error({this.connectionFail});

  final String connectionFail;

  String getByKey(String key) {
    switch (key) {
      case 'connectionFail':
        return connectionFail;
      default:
        return '';
    }
  }
}

class AppLocalizations_Labels {
  const AppLocalizations_Labels(
      {this.title, this.app, this.string, this.btn, this.error});

  final AppLocalizations_Labels_Title title;

  final AppLocalizations_Labels_App app;

  final AppLocalizations_Labels_String string;

  final AppLocalizations_Labels_Btn btn;

  final AppLocalizations_Labels_Error error;

  String getByKey(String key) {
    switch (key) {
      default:
        return '';
    }
  }
}
