import '../../api/adapters/repository_adapter.dart';
import '../../database/entity/all_country.dart';
import '../../database/entity/country_item.dart';
import '../../database/hive.dart';
import '../../shared/api_client/api_client.dart';
import '../../shared/utils/connection.dart';

class CountryRepository implements ICountryRepository {
  CountryRepository({this.apiClient, this.hiveDatabase});

  final ApiClient apiClient;
  final HiveDatabase hiveDatabase;

  @override
  Future<List<CountryItem>> getListCountry(int type) async {
    var casesBox = await hiveDatabase.openAllBox();
    if (await ConnectionUtils.isNetworkConnected() && type == 0) {
      try {
        final response = await apiClient.get(ApiClient.COUNTRY);
        var casesModel =
            AllCountryModel.fromJson(response.data as List<dynamic>);
        casesBox.put(HiveDatabase.ALL_BOX, casesModel);
        return (casesBox.get(HiveDatabase.ALL_BOX) as AllCountryModel)
            .countries;
      } on Exception catch (e) {
        if (casesBox.get(HiveDatabase.ALL_BOX).toString().isNotEmpty) {
          return (casesBox.get(HiveDatabase.ALL_BOX) as AllCountryModel)
              .countries;
        } else {
          return Future.error('Please check your network connection');
        }
      }
    } else {
      if (casesBox.get(HiveDatabase.ALL_BOX).toString().isNotEmpty) {
        return (casesBox.get(HiveDatabase.ALL_BOX) as AllCountryModel)
            .countries;
      } else {
        return Future.error('Please check your network connection');
      }
    }
  }
}
