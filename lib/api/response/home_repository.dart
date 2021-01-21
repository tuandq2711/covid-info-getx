
import 'package:covidtracking/api/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:webfeed/domain/rss_feed.dart';

import '../../api/adapters/repository_adapter.dart';
import '../../api/model/summary.dart';
import '../../database/hive.dart';
import '../../shared/api_client/api_client.dart';
import '../../shared/utils/connection.dart';

class HomeRepository implements IHomeRepository {
  HomeRepository({this.apiClient, this.hiveDatabase});

  final ApiClient apiClient;
  final HiveDatabase hiveDatabase;

  @override
  Future<Summary> getCases() async {
    if (await ConnectionUtils.isNetworkConnected()) {
      try {
        final response = await apiClient.get(ApiClient.SUMMARY);
        var casesModel =
            Summary.fromJson(response.data as Map<String, dynamic>);
        return casesModel;
      } catch (e) {
        return Future.error('Please check your network connection');
      }
    } else {
      return Future.error('Please check your network connection');
    }
  }

  @override
  Future<List<NewsModel>> getNewsList() async {
    var rssFeed = await _loadFeed();
    List<NewsModel> lstNews = [];
    rssFeed.items.forEach((item) {
      if (!item.link.toUpperCase().contains('COVID')) if (!item.link
          .toUpperCase()
          .contains('NCOV')) return;
      var newsModel = NewsModel(
          image: _getImageFromFeed(item.description),
          link: item.link.replaceAll('\'', ""),
          pubDate: DateFormat('dd/MM/yyyy').format(item.pubDate),
          title: item.title);
      lstNews.add(newsModel);
    });
    return lstNews;
  }

  Future<RssFeed> _loadFeed() async {
    try {
      final response = await apiClient.get(ApiClient.VNEXPRESS_URL);
      print(response.toString());
      var data = RssFeed.parse(response.toString());
      return data != null ? data : null;
    } catch (e) {
      _printCatch(e);
    }
    return null;
  }

  String _getImageFromFeed(String description) {
    int indexStart = description.indexOf('src=\"') + 5;
    int indexEnd = description.indexOf('\" ></a>');
    return description.substring(indexStart, indexEnd);
  }

  _printCatch(String e) {
    debugPrint('Catch DataService' + e);
  }
}
