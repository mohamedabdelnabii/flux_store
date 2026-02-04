import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_scaffold.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:go_router/go_router.dart';

class MapPickerView extends StatefulWidget {
  static const String routeName = '/map-picker';
  final LatLng? initialLocation;

  const MapPickerView({super.key, this.initialLocation});

  @override
  State<MapPickerView> createState() => _MapPickerViewState();
}

class _MapPickerViewState extends State<MapPickerView> {
  late final MapController _mapController;
  LatLng _selectedLocation = const LatLng(30.0444, 31.2357); // Cairo default
  String _currentAddress = "Loading address...";
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    if (widget.initialLocation != null) {
      _selectedLocation = widget.initialLocation!;
      _isLoading = false;
      _getAddressFromLatLng(_selectedLocation);
    } else {
      _getCurrentLocation();
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      if (!mounted) return;

      setState(() {
        _selectedLocation = LatLng(position.latitude, position.longitude);
        _isLoading = false;
      });
      _mapController.move(_selectedLocation, 15);
      _getAddressFromLatLng(_selectedLocation);
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);
      _getAddressFromLatLng(_selectedLocation);
    }
  }

  Future<void> _getAddressFromLatLng(LatLng latLng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );
      if (!mounted) return;

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        setState(() {
          _currentAddress =
              '${place.street}, ${place.subLocality}, ${place.locality}';
        });
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => _currentAddress = "Unknown location");
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _selectedLocation,
              initialZoom: 15,
              onPositionChanged: (position, hasGesture) {
                if (hasGesture) {
                  setState(() {
                    _selectedLocation = position.center;
                  });
                }
              },
              onMapEvent: (event) {
                if (event is MapEventMoveEnd) {
                  _getAddressFromLatLng(_selectedLocation);
                }
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.flux_store',
              ),
            ],
          ),
          // Static Marker in Center
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 35.h),
              child: Icon(
                Icons.location_on,
                color: AppColors.primary,
                size: 40.sp,
              ),
            ),
          ),
          // Address Overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 20,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: AppColors.primary,
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          _currentAddress,
                          style: AppTextStyles.font14GrayMedium.copyWith(
                            color: AppColors.black,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26.r),
                        ),
                      ),
                      onPressed: () async {
                        List<Placemark> placemarks =
                            await placemarkFromCoordinates(
                              _selectedLocation.latitude,
                              _selectedLocation.longitude,
                            );
                        if (context.mounted) {
                          context.pop({
                            'location': _selectedLocation,
                            'placemark': placemarks.isNotEmpty
                                ? placemarks[0]
                                : null,
                          });
                        }
                      },
                      child: Text(
                        "CONFIRM LOCATION",
                        style: AppTextStyles.font14WhiteBold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Back Button
          Positioned(
            top: 40.h,
            left: 20.w,
            child: GestureDetector(
              onTap: () => context.pop(),
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back, color: AppColors.black),
              ),
            ),
          ),
          if (_isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
