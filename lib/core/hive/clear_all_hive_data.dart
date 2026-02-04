import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flux_store/core/hive/hive_box_name.dart';

Future<void> clearAllHiveData() async {
  try {
    // List of all box names used in the app
    final boxNames = [
      HiveBoxName.products,
      HiveBoxName.mainCategory,
      HiveBoxName.labs,
      HiveBoxName.doctors,
    ];

    // Clear each box
    for (final boxName in boxNames) {
      if (Hive.isBoxOpen(boxName)) {
        final box = Hive.box(boxName);
        await box.clear();
      } else {
        // Open box, clear it, then close it
        final box = await Hive.openBox(boxName);
        await box.clear();
        await box.close();
      }
    }

    if (kDebugMode) {
      print('✅ All Hive cache cleared successfully');
    }
  } catch (e) {
    if (kDebugMode) {
      print('❌ Error clearing Hive cache: $e');
    }
  }
}
