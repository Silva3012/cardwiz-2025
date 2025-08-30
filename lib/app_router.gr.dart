// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:cardwiz/presentation/screens/credit_card_list_page.dart' as _i1;
import 'package:cardwiz/presentation/screens/main_page.dart' as _i2;
import 'package:cardwiz/presentation/screens/placeholder_page.dart' as _i3;

/// generated route for
/// [_i1.CreditCardListPage]
class CreditCardListRoute extends _i4.PageRouteInfo<void> {
  const CreditCardListRoute({List<_i4.PageRouteInfo>? children})
      : super(
          CreditCardListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreditCardListRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.CreditCardListPage();
    },
  );
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i4.PageRouteInfo<void> {
  const MainRoute({List<_i4.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.MainPage();
    },
  );
}

/// generated route for
/// [_i3.PlaceHolderPage]
class PlaceHolderRoute extends _i4.PageRouteInfo<void> {
  const PlaceHolderRoute({List<_i4.PageRouteInfo>? children})
      : super(
          PlaceHolderRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlaceHolderRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.PlaceHolderPage();
    },
  );
}
