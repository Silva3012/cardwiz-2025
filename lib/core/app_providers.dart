import 'package:cardwiz/application/credit_card/credit_card_bloc.dart';
import 'package:cardwiz/core/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppProviders extends StatelessWidget {
  const AppProviders({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CreditCardBloc>(
          create: (context) => cardWizSl<CreditCardBloc>(),
        ),
      ],
      child: child,
    );
  }
}
