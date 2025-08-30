import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:cardwiz/presentation/widgets/bottom_navigation_bar.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CardWizBottomNavigationBar();
  }
}
