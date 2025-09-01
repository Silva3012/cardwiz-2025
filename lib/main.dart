import 'package:cardwiz/app.dart';
import 'package:cardwiz/app_providers.dart';
import 'package:cardwiz/injection.dart';
import 'package:flutter/material.dart';

void main() async {
  await configureDependencies();
  runApp(
    AppProviders(
      child: CardWizApp(),
    ),
  );
}
