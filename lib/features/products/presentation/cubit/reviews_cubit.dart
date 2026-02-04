import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/products/data/models/review_model.dart';
import 'package:hive/hive.dart';
import 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  final Box<ReviewModel> _reviewsBox = Hive.box<ReviewModel>('reviews_box');

  ReviewsCubit() : super(const ReviewsState.initial());

  void getProductReviews(String productId) {
    if (isClosed) return;
    emit(const ReviewsState.loading());
    final reviews = _reviewsBox.values
        .where((review) => review.productId == productId)
        .toList();
    if (isClosed) return;
    emit(ReviewsState.success(reviews));
  }

  void getUserReviews(String userName) {
    if (isClosed) return;
    emit(const ReviewsState.loading());
    final reviews = _reviewsBox.values
        .where((review) => review.userName == userName)
        .toList();
    if (isClosed) return;
    emit(ReviewsState.success(reviews));
  }

  Future<void> addReview(ReviewModel review) async {
    await _reviewsBox.add(review);
    getProductReviews(review.productId);
  }
}
