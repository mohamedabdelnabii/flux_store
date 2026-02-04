import 'package:flutter/material.dart';
import '../widgets/welcome_view_body.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  static const String routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: WelcomeViewBody());
  }
}
