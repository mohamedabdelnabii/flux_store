import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_text_button.dart';
import 'package:flux_store/core/widgets/custom_text_form_field.dart';
import 'package:flux_store/features/addresses/presentation/cubit/addresses_cubit.dart';
import 'package:flux_store/generated/l10n.dart';
import 'package:flux_store/features/addresses/data/models/address_response.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flux_store/core/widgets/custom_snack_bar.dart';
import 'package:flux_store/features/addresses/presentation/widgets/map_picker_view.dart';

class AddAddressSheet extends StatefulWidget {
  final AddressModel? address;
  const AddAddressSheet({super.key, this.address});

  @override
  State<AddAddressSheet> createState() => _AddAddressSheetState();
}

class _AddAddressSheetState extends State<AddAddressSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _detailsController;
  late final TextEditingController _phoneController;
  late final TextEditingController _cityController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.address?.name);
    _detailsController = TextEditingController(text: widget.address?.details);
    _phoneController = TextEditingController(text: widget.address?.phone);
    _cityController = TextEditingController(text: widget.address?.city);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _detailsController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  Future<void> _pickOnMap() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MapPickerView()),
    );

    if (result != null && result is Map<String, dynamic>) {
      final placemark = result['placemark'] as Placemark?;
      if (placemark != null) {
        setState(() {
          _cityController.text =
              placemark.locality ?? placemark.administrativeArea ?? '';
          _detailsController.text =
              '${placemark.street}, ${placemark.subLocality}';
        });
      }
    }
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (mounted) {
        CustomSnackBar.show(
          context,
          message: 'Location services are disabled.',
          backgroundColor: AppColors.error,
          hasBottomNav: false,
        );
      }
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (mounted) {
          CustomSnackBar.show(
            context,
            message: 'Location permissions are denied',
            backgroundColor: AppColors.error,
            hasBottomNav: false,
          );
        }
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (mounted) {
        CustomSnackBar.show(
          context,
          message: 'Location permissions are permanently denied.',
          backgroundColor: AppColors.error,
          hasBottomNav: false,
        );
      }
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition();
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        setState(() {
          _cityController.text =
              place.locality ?? place.administrativeArea ?? '';
          _detailsController.text = '${place.street}, ${place.subLocality}';
        });
      }
    } catch (e) {
      if (mounted) {
        CustomSnackBar.show(
          context,
          message: 'Failed to get location: $e',
          backgroundColor: AppColors.error,
          hasBottomNav: false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 24.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 60.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: AppColors.greyLight,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                ),
                vGap(24.h),
                Text(
                  widget.address == null ? s.addNewAddress : "Edit Address",
                  style: AppTextStyles.font18BlackBold,
                ),
                vGap(12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: _getCurrentLocation,
                      child: Row(
                        children: [
                          Icon(
                            Icons.my_location,
                            color: AppColors.primary,
                            size: 18.sp,
                          ),
                          hGap(8.w),
                          Text(
                            "Current Location",
                            style: AppTextStyles.font14PrimaryBold,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: _pickOnMap,
                      child: Row(
                        children: [
                          Icon(
                            Icons.map_outlined,
                            color: AppColors.primary,
                            size: 18.sp,
                          ),
                          hGap(8.w),
                          Text(
                            "Pick on Map",
                            style: AppTextStyles.font14PrimaryBold,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                vGap(24.h),
                CustomTextFormField(
                  controller: _nameController,
                  hintText: s.name,
                  textInputType: TextInputType.name,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Name is required";
                    }
                    return null;
                  },
                ),
                vGap(16.h),
                CustomTextFormField(
                  controller: _phoneController,
                  hintText: s.phoneNumber,
                  textInputType: TextInputType.phone,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Phone is required";
                    }
                    return null;
                  },
                ),
                vGap(16.h),
                CustomTextFormField(
                  controller: _detailsController,
                  hintText: s.streetAddress,
                  textInputType: TextInputType.streetAddress,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Address is required";
                    }
                    return null;
                  },
                ),
                vGap(16.h),
                CustomTextFormField(
                  controller: _cityController,
                  hintText: s.city,
                  textInputType: TextInputType.text,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "City is required";
                    }
                    return null;
                  },
                ),
                vGap(32.h),
                CustomTextButton(
                  text: s.save,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      if (widget.address == null) {
                        context.read<AddressesCubit>().addAddress(
                          _nameController.text,
                          _detailsController.text,
                          _phoneController.text,
                          _cityController.text,
                        );
                      } else {
                        context.read<AddressesCubit>().removeAddress(
                          widget.address!.id!,
                        );
                        context.read<AddressesCubit>().addAddress(
                          _nameController.text,
                          _detailsController.text,
                          _phoneController.text,
                          _cityController.text,
                        );
                      }
                      Navigator.pop(context);
                    }
                  },
                ),
                vGap(MediaQuery.of(context).viewInsets.bottom + 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
