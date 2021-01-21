import '../../api/adapters/repository_adapter.dart';
import '../../database/entity/country_item.dart';
import '../../shared/api_client/api_client.dart';
import '../../shared/utils/connection.dart';

class CountryDetailRepository implements ICountryDetailRepository {
  CountryDetailRepository({this.apiClient});

  final ApiClient apiClient;

  @override
  Future<CountryItem> getCountryDetail(String country) async {
    if (await ConnectionUtils.isNetworkConnected()) {
      try {
        final response = await apiClient.get(ApiClient.COUNTRY + '/$country');
        var casesModel =
            CountryItem.fromJson(response.data as Map<String, dynamic>);
        return casesModel;
      } catch (e) {
        return Future.error('Please check your network connection');
      }
    } else {
      return Future.error('Please check your network connection');
    }
  }
}
