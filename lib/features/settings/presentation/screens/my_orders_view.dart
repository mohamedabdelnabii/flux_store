import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_back_app_bar.dart';
import 'package:flux_store/core/widgets/custom_scaffold.dart';
import 'package:flux_store/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flux_store/features/settings/data/models/order_model.dart';
import 'package:flux_store/features/settings/presentation/widgets/settings_shimmer.dart';
import 'package:flux_store/generated/l10n.dart';

class MyOrdersView extends StatefulWidget {
  static const String routeName = '/my-orders';
  const MyOrdersView({super.key});

  @override
  State<MyOrdersView> createState() => _MyOrdersViewState();
}

class _MyOrdersViewState extends State<MyOrdersView> {
  @override
  void initState() {
    super.initState();
    context.read<SettingsCubit>().getOrders();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return CustomScaffold(
      appBar: CustomBackAppBar(title: s.myOrders),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final isLoading = state.isOrdersLoading;
          final orders = state.orders;
          final error = state.error;

          if (error != null && orders == null) {
            return Center(child: Text(error));
          }

          return DefaultTabController(
            length: 3,
            child: Column(
              children: [
                TabBar(
                  labelColor: AppColors.black,
                  unselectedLabelColor: AppColors.grey,
                  indicatorColor: AppColors.primary,
                  labelStyle: AppTextStyles.font16BlackBold,
                  tabs: [
                    Tab(text: s.pending),
                    Tab(text: s.delivered),
                    Tab(text: s.cancelled),
                  ],
                ),
                Expanded(
                  child: (isLoading && orders == null)
                      ? const OrdersShimmer()
                      : TabBarView(
                          children: [
                            _OrdersList(
                              orders: orders ?? [],
                              status: s.pending,
                            ),
                            _OrdersList(
                              orders: orders ?? [],
                              status: s.delivered,
                            ),
                            _OrdersList(
                              orders: orders ?? [],
                              status: s.cancelled,
                            ),
                          ],
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _OrdersList extends StatelessWidget {
  final List<OrderModel> orders;
  final String status;
  const _OrdersList({required this.orders, required this.status});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final filteredOrders = orders.where((order) {
      if (status == s.delivered) {
        return order.isDelivered == true;
      } else if (status == s.cancelled) {
        // Assuming status string 'cancelled' for cancelled orders
        return order.status == 'cancelled';
      } else {
        // Pending: Not delivered yet
        return order.isDelivered == false;
      }
    }).toList();

    if (filteredOrders.isEmpty) {
      return Center(child: Text("${s.no_search_results} ($status)"));
    }

    return ListView.builder(
      padding: EdgeInsets.all(20.w),
      itemCount: filteredOrders.length,
      itemBuilder: (context, index) {
        final order = filteredOrders[index];
        return Container(
          margin: EdgeInsets.only(bottom: 16.h),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order #${order.id?.substring(0, 8) ?? ""}",
                    style: AppTextStyles.font16BlackBold,
                  ),
                  Text(
                    order.createdAt?.split('T')[0] ?? "",
                    style: AppTextStyles.font14GreyMedium,
                  ),
                ],
              ),
              vGap(12.h),
              Row(
                children: [
                  Text(
                    "${s.totalAmount}: \$${order.totalOrderPrice ?? 0}",
                    style: AppTextStyles.font16BlackBold,
                  ),
                  const Spacer(),
                  Text(
                    status,
                    style: status == s.cancelled
                        ? AppTextStyles.font14GrayMedium.copyWith(
                            color: AppColors.error,
                          )
                        : AppTextStyles.font14SuccessBold,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
