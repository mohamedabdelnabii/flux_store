import 'package:dio/dio.dart';
import 'package:flux_store/core/networking/api_constants.dart';
import 'package:flux_store/features/products/data/models/product_response.dart';
import 'package:retrofit/retrofit.dart';

part 'products_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ProductsApiService {
  factory ProductsApiService(Dio dio, {String baseUrl}) = _ProductsApiService;

  @GET(ApiConstants.products)
  Future<ProductResponse> getProducts({
    @Query("sort") String? sort,
    @Query("limit") int? limit,
    @Query("page") int? page,
    @Query("category") String? categoryId,
    @Query("brand") String? brandId,
    @Query("price[gte]") int? minPrice,
    @Query("price[lte]") int? maxPrice,
  });

  @GET("${ApiConstants.products}/{id}")
  Future<SingleProductResponse> getProductDetails(@Path("id") String id);
}
