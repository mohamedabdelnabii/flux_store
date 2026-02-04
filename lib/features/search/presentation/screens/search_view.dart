import 'package:flutter/material.dart';
import 'package:flux_store/core/widgets/custom_back_app_bar.dart';
import 'package:flux_store/core/widgets/custom_scaffold.dart';
import 'package:flux_store/features/search/presentation/widgets/search/search_view_body.dart';
import 'package:flux_store/generated/l10n.dart';

class SearchView extends StatelessWidget {
  static const String routeName = '/search';
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return CustomScaffold(
      appBar: CustomBackAppBar(title: s.search),
      body: SearchViewBody(),
    );
  }
}
