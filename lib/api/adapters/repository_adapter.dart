// ignore: one_member_abstracts
import 'package:covidtracking/api/model/news_model.dart';

import '../../api/model/summary.dart';
import '../../database/entity/country_item.dart';

abstract class IHomeRepository {
  Future<Summary> getCases();
  Future<List<NewsModel>> getNewsList();
}

abstract class ICountryRepository {
  Future<List<CountryItem>> getListCountry(int type);
}

abstract class ICountryDetailRepository {
  Future<CountryItem> getCountryDetail(String country);
}
