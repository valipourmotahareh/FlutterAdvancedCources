import 'package:advanced_flutter/features/chaching_data/features/home/data/model/hive_helper/fields/product_fields.dart';
import 'package:advanced_flutter/features/chaching_data/features/home/data/model/hive_helper/hive_types.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// id : 1
/// price : 778.69
/// category : "physical"
/// updated_at : "2023-03-03T13:57:09.399080"
/// photo_url : "https://api.slingacademy.com/public/sample-products/1.png"
/// name : "Product 1"
/// description : "Others few us role set."
/// created_at : "2023-03-03T13:57:09.399076"
part 'products.g.dart';
@HiveType(typeId: HiveTypes.product)
class Products extends HiveObject {
  @HiveField(ProductFields.id)
  final int id;
  @HiveField(ProductFields.price)
  final double price;
  @HiveField(ProductFields.category)
  final String category;
  @HiveField(ProductFields.updatedAt)
  final DateTime updatedAt;
  @HiveField(ProductFields.photoUrl)
  final String photoUrl;
  @HiveField(ProductFields.name)
  final String name;
  @HiveField(ProductFields.description)
  final String description;
  @HiveField(ProductFields.createdAt)
  final DateTime createdAt;
  Products({
      required this.id,
      required this.price,
      required this.category,
      required this.updatedAt,
      required this.photoUrl,
      required this.name,
      required this.description,
      required this.createdAt,});

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    id: json["id"],
    price: json["price"]?.toDouble(),
    category: json["category"].toString(),
    updatedAt: DateTime.parse(json["updated_at"]),
    photoUrl: json["photo_url"],
    name: json["name"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
  );
}