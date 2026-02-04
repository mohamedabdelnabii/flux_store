import 'package:json_annotation/json_annotation.dart';
import 'package:flux_store/features/products/data/models/product_response.dart';

part 'wishlist_response.g.dart';

@JsonSerializable()
class WishlistResponse {
  final String? status;
  final int? count;
  @JsonKey(name: 'data')
  final List<ProductModel>? data;

  WishlistResponse({this.status, this.count, this.data});

  factory WishlistResponse.fromJson(Map<String, dynamic> json) =>
      _$WishlistResponseFromJson(json);
}
