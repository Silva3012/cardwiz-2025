import 'package:auto_route/auto_route.dart';
import 'package:cardwiz/core/router/app_router.gr.dart';
import 'package:flutter/material.dart';

class CardWizBottomNavigationBar extends StatelessWidget {
  const CardWizBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        AddCardRoute(),
        CreditCardListRoute(),
        BannedCountriesRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          backgroundColor: const Color(0xFF101820),
          selectedItemColor: Colors.greenAccent,
          unselectedItemColor: Colors.white70,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.credit_card),
              label: "Add Card",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder),
              label: "Captured Cards",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.public),
              label: "Banned Countries",
            ),
          ],
        );
      },
    );
  }
}
