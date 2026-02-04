import 'package:flutter/material.dart';
import 'package:flux_store/core/widgets/custom_back_app_bar.dart';
import 'package:flux_store/core/widgets/custom_scaffold.dart';
import 'package:flux_store/features/search/presentation/widgets/filter/found_results_view_body.dart';
import 'package:flux_store/generated/l10n.dart';

class FoundResultView extends StatelessWidget {
  static const String routeName = '/found-result';
  const FoundResultView({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return CustomScaffold(
      appBar: CustomBackAppBar(title: s.dresses),
      body: FoundResultsViewBody(),
    );
  }
}
