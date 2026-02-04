import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/core/di/dependency_injection.dart';
import 'package:flux_store/core/widgets/custom_scaffold.dart';
import 'package:flux_store/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flux_store/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flux_store/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:flux_store/features/cart/presentation/screens/cart_view.dart';
import 'package:flux_store/features/home/presentation/cubit/home_cubit.dart';
import 'package:flux_store/features/home/presentation/cubit/bottom_nav_bar_cubit.dart';
import 'package:flux_store/features/home/presentation/screens/home_view.dart';
import 'package:flux_store/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:flux_store/features/search/presentation/cubit/search_cubit.dart';
import 'package:flux_store/features/search/presentation/screens/discover_view.dart';
import 'package:flux_store/features/settings/presentation/screens/profile_view.dart';

class BottomNavBarView extends StatelessWidget {
  const BottomNavBarView({super.key});
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<HomeCubit>()..getHomeData()),
        BlocProvider.value(value: getIt<SearchCubit>()),
        BlocProvider(create: (context) => getIt<CartCubit>()..getCartItems()),
        BlocProvider(create: (context) => getIt<SettingsCubit>()..getProfile()),
        BlocProvider(
          create: (context) => getIt<OrdersCubit>()..getUserOrders(),
        ),
      ],
      child: const BottomNavBarContent(),
    );
  }
}

class BottomNavBarContent extends StatelessWidget {
  const BottomNavBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> homeBodies = [
      const HomeView(),
      const DiscoverView(),
      const CartView(),
      const ProfileView(),
    ];
    return CustomScaffold(
      extendBody: true,
      body: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          return homeBodies[context.read<BottomNavBarCubit>().currentIndex];
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
