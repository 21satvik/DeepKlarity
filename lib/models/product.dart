import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  late String productName;

  @HiveField(1)
  late String productURL;

  @HiveField(2)
  late int productRating;

  @HiveField(3)
  late String productDescription;

  Product({
    required this.productName,
    required this.productURL,
    required this.productRating,
    required this.productDescription,
  });

  factory Product.fromJson(Map<String, dynamic> data) {
    return Product(
      productName: data['productName'],
      productURL: data['productURL'],
      productRating: data['productRating'],
      productDescription: data['productDescription'],
    );
  }
}
