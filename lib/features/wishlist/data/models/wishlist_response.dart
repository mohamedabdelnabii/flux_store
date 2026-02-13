import 'package:json_annotation/json_annotation.dart';
import 'package:flux_store/features/products/data/models/product_response.dart';

part 'wishlist_response.g.dart';

@JsonSerializable()
class WishlistResponse {
  final String? status;
  final int? count;
  @JsonKey(name: 'data')
  final List<dynamic>? data;

  WishlistResponse({this.status, this.count, this.data});

  factory WishlistResponse.fromJson(Map<String, dynamic> json) =>
      _$WishlistResponseFromJson(json);

  List<ProductModel>? get products {
    if (data == null) return null;
    return data!.map((item) {
      if (item is ProductModel) return item;
      if (item is String) return ProductModel(id: item);
      if (item is Map<String, dynamic>) return ProductModel.fromJson(item);
      return ProductModel(id: item.toString());
    }).toList();
  }
}
