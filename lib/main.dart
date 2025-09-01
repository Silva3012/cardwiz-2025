import 'package:cardwiz/core/app.dart';
import 'package:cardwiz/core/app_providers.dart';
import 'package:cardwiz/core/injection.dart';
import 'package:flutter/material.dart';

void main() async {
  await configureDependencies();
  runApp(
    AppProviders(
      child: CardWizApp(),
    ),
  );
}
