import 'package:auto_route/auto_route.dart';
import 'package:cardwiz/presentation/add_card/widgets/credit_card_form/credit_card_form.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AddCardPage extends StatelessWidget {
  const AddCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CreditCardForm(),
        ],
      ),
    ));
  }
}
