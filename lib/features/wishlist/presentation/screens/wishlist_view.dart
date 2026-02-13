import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/app_constants.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_back_app_bar.dart';
import 'package:flux_store/core/widgets/custom_scaffold.dart';
import 'package:flux_store/features/home/presentation/widgets/products/product_card.dart';
import 'package:flux_store/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:flux_store/features/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:flux_store/generated/l10n.dart';
import 'package:flux_store/features/home/presentation/widgets/shimmer/home_shimmer.dart';

class WishlistView extends StatelessWidget {
  static const String routeName = '/wishlist';
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    // No longer providing the Cubit here because it's already provided globally in MyApp
    return const WishlistViewBody();
  }
}

class WishlistViewBody extends StatelessWidget {
  const WishlistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return CustomScaffold(
      backgroundColor: AppColors.white,
      appBar: CustomBackAppBar(title: s.wishlist),
      body: BlocBuilder<WishlistCubit, WishlistState>(
        builder: (context, state) {
          final isLoading = state.isLoading;
          final wishlistResponse = state.wishlistResponse;
          final error = state.error;
          final products = wishlistResponse?.data ?? [];

          if (error != null && wishlistResponse == null) {
            return Center(
              child: Text(error.isNotEmpty ? error : s.errorOccurred),
            );
          }

          if (isLoading && wishlistResponse == null) {
            return const Padding(
              padding: EdgeInsets.all(20),
              child: ProductGridShimmer(),
            );
          }

          if (wishlistResponse == null || products.isEmpty) {
            return Center(
              child: Text(
                s.emptyWishlist,
                style: AppTextStyles.font16GreyMedium,
              ),
            );
          }

          return GridView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.paddingHorizontal,
              vertical: 20.h,
            ),
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) {
              final item = products[index];
              return Stack(
                children: [
                  ProductCard(
                    image: item.imageCover ?? '',
                    title: item.title ?? '',
                    price: (item.price ?? 0).toDouble(),
                    id: item.id,
                  ),
                  Positioned(
                    top: 5.h,
                    right: 5.w,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.black54),
                      onPressed: () {
                        context.read<WishlistCubit>().toggleWishlist(
                          item.id!,
                          true,
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
