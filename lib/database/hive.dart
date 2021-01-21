import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'entity/all_country.dart';
import 'entity/country_info.dart';
import 'entity/country_item.dart';

class HiveDatabase {
  static const String ALL_BOX = 'allBox';

  static Future<void> initHiveDatabase() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    Hive.registerAdapter(AllCountryModelAdapter());
    Hive.registerAdapter(CountryItemAdapter());
    Hive.registerAdapter(CountryInfoAdapter());
  }

  Future<Box> openAllBox() async {
    var casesBox = await Hive.openBox(ALL_BOX);
    return casesBox;
  }
}
