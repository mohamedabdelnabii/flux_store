import 'package:flutter/material.dart';
import 'package:flux_store/features/search/presentation/widgets/discover/discover_view_body.dart';

class DiscoverView extends StatelessWidget {
  static const String routeName = '/discover';
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return DiscoverViewBody();
  }
}
