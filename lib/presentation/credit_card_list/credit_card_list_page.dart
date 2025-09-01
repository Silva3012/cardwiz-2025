import 'package:auto_route/auto_route.dart';
import 'package:cardwiz/application/credit_card/credit_card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CreditCardListPage extends StatelessWidget {
  const CreditCardListPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CreditCardBloc>().add(const CreditCardEvent.onGetCards());

    return Scaffold(
      backgroundColor: const Color(0xFF101820),
      appBar: AppBar(
        backgroundColor: const Color(0xFF101820),
        elevation: 0,
        title: const Text(
          "Captured Cards",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CreditCardBloc, CreditCardState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.failure != null) {
            return Center(
              child: Text(
                "Failed to load cards: ${state.failure}",
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          final cards = state.cards;

          if (cards.isEmpty) {
            return const Center(
              child: Text(
                "No cards captured yet",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: cards.length,
            itemBuilder: (context, index) {
              final card = cards[index];
              final color = _getCardColor(index);
              final last4 = card.cardNumber.length >= 4
                  ? card.cardNumber.substring(card.cardNumber.length - 4)
                  : card.cardNumber;

              return Dismissible(
                key: Key(card.cardNumber),
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  color: Colors.red,
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (_) {
                  context.read<CreditCardBloc>().add(
                        CreditCardEvent.onDeleteCard(
                            cardNumber: card.cardNumber),
                      );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Card deleted')),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Credit Card",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "**** **** **** $last4",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "ISSUING COUNTRY",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                card.issuingCountry.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                "CARD TYPE",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                card.cardType.name.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Color _getCardColor(int index) {
    final colors = [
      Colors.blue,
      Colors.black87,
      Colors.teal,
      Colors.deepOrange,
      Colors.purple,
      Colors.green,
    ];
    return colors[index % colors.length];
  }
}
