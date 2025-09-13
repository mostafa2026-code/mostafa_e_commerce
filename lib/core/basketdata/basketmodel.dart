
import 'package:hive/hive.dart';
part 'basketmodel.g.dart';
@HiveType(typeId: 0)
class Basketmodel {
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String id;
  @HiveField(3)
  final String image;
  @HiveField(4)
  final int pecknumber;
  @HiveField(5)
  // ignore: non_constant_identifier_names
  final double total_price;

  // ignore: non_constant_identifier_names
  Basketmodel({required this.name, required this.id, required this.image, required this.pecknumber, required this.total_price});
  

}