import 'package:flutter/material.dart';
import 'package:flux_store/core/functions/app_initializer.dart';
import 'package:flux_store/my_app.dart';

void main() async {
  await AppInitializer.initCore();
  await AppInitializer.initRouter();

  runApp(MyApp());
}
