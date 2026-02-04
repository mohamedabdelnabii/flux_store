import 'package:json_annotation/json_annotation.dart';
import 'package:flux_store/features/products/data/models/product_response.dart';

part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse {
  final List<ProductModel>? products;

  SearchResponse({this.products});

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
}
