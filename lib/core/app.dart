import 'package:cardwiz/core/router/app_router.dart';
import 'package:flutter/material.dart';

class CardWizApp extends StatelessWidget {
  CardWizApp({super.key});

  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CardWiz',
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
