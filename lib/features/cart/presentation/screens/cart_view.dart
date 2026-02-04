import 'package:flutter/material.dart';
import 'package:flux_store/features/cart/presentation/screens/cart_view_body.dart';

class CartView extends StatelessWidget {
  static const String routeName = '/cart-view';
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CartViewBody();
  }
}
