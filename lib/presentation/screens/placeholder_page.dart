import 'package:auto_route/auto_route.dart';
import 'package:cardwiz/presentation/widgets/placeholder_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PlaceHolderPage extends StatelessWidget {
  const PlaceHolderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderWidget();
  }
}
