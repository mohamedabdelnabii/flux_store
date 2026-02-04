import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/core/di/dependency_injection.dart';
import 'package:flux_store/core/widgets/custom_scaffold.dart';
import 'package:flux_store/features/home/presentation/cubit/home_cubit.dart';
import 'package:flux_store/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  static const String routeName = '/home-view';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..getHomeData(),
      child: const CustomScaffold(body: HomeViewBody()),
    );
  }
}
