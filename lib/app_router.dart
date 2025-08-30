import 'package:auto_route/auto_route.dart';
import 'package:cardwiz/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          initial: true,
          children: [
            AutoRoute(page: PlaceHolderRoute.page),
            AutoRoute(page: PlaceHolderRoute.page),
            AutoRoute(page: PlaceHolderRoute.page),
          ],
        )
      ];
}
