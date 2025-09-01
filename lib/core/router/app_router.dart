import 'package:auto_route/auto_route.dart';
import 'package:cardwiz/core/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          initial: true,
          children: [
            AutoRoute(page: AddCardRoute.page),
            AutoRoute(page: CreditCardListRoute.page),
            AutoRoute(page: PlaceHolderRoute.page),
          ],
        )
      ];
}
