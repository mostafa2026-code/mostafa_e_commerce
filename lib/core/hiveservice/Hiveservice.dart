// ignore: file_names
import 'package:hive/hive.dart';
import 'package:mostafa_e_commerce/core/basketdata/basketmodel.dart';

class Hiveservice {
  static late Box basketbox;

  static init() async {
    basketbox = await Hive.openBox("basketbox");
    Hive.registerAdapter(BasketmodelAdapter());
  }

  static addtobasket(key, value) async {
    await basketbox.put(key, value);
  }

  static Basketmodel getbasketdate(key) {
    return basketbox.get(key);
  }
}
