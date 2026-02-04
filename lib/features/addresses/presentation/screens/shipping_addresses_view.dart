import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_back_app_bar.dart';
import 'package:flux_store/core/widgets/custom_scaffold.dart';
import 'package:flux_store/features/addresses/presentation/cubit/addresses_cubit.dart';
import 'package:flux_store/features/addresses/presentation/cubit/addresses_state.dart';
import 'package:flux_store/generated/l10n.dart';
import 'package:flux_store/features/addresses/presentation/widgets/add_address_sheet.dart';
import 'package:flux_store/features/settings/presentation/widgets/settings_shimmer.dart';

class ShippingAddressesView extends StatefulWidget {
  static const String routeName = '/shipping-addresses';
  const ShippingAddressesView({super.key});

  @override
  State<ShippingAddressesView> createState() => _ShippingAddressesViewState();
}

class _ShippingAddressesViewState extends State<ShippingAddressesView> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    context.read<AddressesCubit>().getAddresses();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return CustomScaffold(
      appBar: CustomBackAppBar(title: s.shippingAddresses),
      body: BlocBuilder<AddressesCubit, AddressesState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const AddressesShimmer(),
            error: (error) => Center(child: Text(error)),
            success: (response) {
              final addresses = response.data ?? [];
              if (addresses.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_off_outlined,
                        size: 80.sp,
                        color: AppColors.grey,
                      ),
                      vGap(16.h),
                      Text(
                        "No Shipping Addresses",
                        style: AppTextStyles.font18BlackBold,
                      ),
                      vGap(8.h),
                      Text(
                        "Add your first address to continue",
                        style: AppTextStyles.font14GreyRegular,
                      ),
                      vGap(24.h),
                      SizedBox(
                        width: 200.w,
                        height: 48.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (ctx) => BlocProvider.value(
                                value: context.read<AddressesCubit>(),
                                child: const AddAddressSheet(),
                              ),
                            ).then((_) {
                              if (context.mounted) {
                                context.read<AddressesCubit>().getAddresses();
                              }
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: AppColors.white,
                                size: 20.sp,
                              ),
                              hGap(8.w),
                              Text(
                                "Add Address",
                                style: AppTextStyles.font14WhiteBold,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Stack(
                children: [
                  ListView.builder(
                    padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 100.h),
                    itemCount: addresses.length,
                    itemBuilder: (context, index) {
                      final address = addresses[index];
                      final bool isSelected = selectedIndex == index;
                      return Dismissible(
                        key: Key(address.id ?? UniqueKey().toString()),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 20.w),
                          margin: EdgeInsets.only(bottom: 20.h),
                          decoration: BoxDecoration(
                            color: AppColors.error,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: const Icon(
                            Icons.delete,
                            color: AppColors.white,
                          ),
                        ),
                        onDismissed: (_) {
                          context.read<AddressesCubit>().removeAddress(
                            address.id!,
                          );
                        },
                        child: GestureDetector(
                          onTap: () {
                            setState(() => selectedIndex = index);
                            Navigator.pop(context, address);
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20.h),
                            padding: EdgeInsets.all(20.w),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.black
                                    : AppColors.transparent,
                                width: 1.5.w,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.black.withValues(
                                    alpha: 0.05,
                                  ),
                                  blurRadius: 15,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        address.name ?? "Address",
                                        style: AppTextStyles.font16BlackBold,
                                      ),
                                      vGap(8.h),
                                      Text(
                                        "${address.details}\n${address.city}, ${address.phone}",
                                        style: AppTextStyles.font14GrayMedium
                                            .copyWith(
                                              color: AppColors.black.withValues(
                                                alpha: 0.6,
                                              ),
                                              height: 1.4,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    if (isSelected)
                                      Icon(
                                        Icons.check_circle,
                                        color: AppColors.black,
                                        size: 24.sp,
                                      ),
                                    IconButton(
                                      icon: Icon(Icons.edit, size: 20.sp),
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (ctx) => BlocProvider.value(
                                            value: context
                                                .read<AddressesCubit>(),
                                            child: AddAddressSheet(
                                              address: address,
                                            ),
                                          ),
                                        ).then((_) {
                                          if (context.mounted) {
                                            context
                                                .read<AddressesCubit>()
                                                .getAddresses();
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 20.h,
                    left: 20.w,
                    right: 20.w,
                    child: SizedBox(
                      width: double.infinity,
                      height: 52.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26.r),
                          ),
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (ctx) => BlocProvider.value(
                              value: context.read<AddressesCubit>(),
                              child: const AddAddressSheet(),
                            ),
                          ).then((_) {
                            if (context.mounted) {
                              context.read<AddressesCubit>().getAddresses();
                            }
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: AppColors.white,
                              size: 20.sp,
                            ),
                            hGap(8.w),
                            Text(
                              "ADD NEW ADDRESS",
                              style: AppTextStyles.font14WhiteBold.copyWith(
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
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
