class ProductUIModel {
  final String id;
  final String title;
  final String image;
  final double price;
  final String? description;
  final double? rating;
  final int? reviewsCount;
  final bool isFavorite;

  ProductUIModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    this.description,
    this.rating,
    this.reviewsCount,
    this.isFavorite = false,
  });
}
