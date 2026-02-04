import 'package:flux_store/features/categories/data/models/category_response.dart';
import 'package:flux_store/features/products/data/models/product_response.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_response.g.dart';

@JsonSerializable()
@HiveType(typeId: 9)
class HomeResponse {
  @HiveField(0)
  final List<CategoryModel>? categories;
  @HiveField(1)
  final List<ProductModel>? products;

  HomeResponse({this.categories, this.products});

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);
}
