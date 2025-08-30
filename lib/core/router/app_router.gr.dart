// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:cardwiz/presentation/add_card/add_card_page.dart' as _i1;
import 'package:cardwiz/presentation/credit_card_list/credit_card_list_page.dart'
    as _i2;
import 'package:cardwiz/presentation/main_page/main_page.dart' as _i3;
import 'package:cardwiz/presentation/placeholder/placeholder_page.dart' as _i4;

/// generated route for
/// [_i1.AddCardPage]
class AddCardRoute extends _i5.PageRouteInfo<void> {
  const AddCardRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AddCardRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddCardRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddCardPage();
    },
  );
}

/// generated route for
/// [_i2.CreditCardListPage]
class CreditCardListRoute extends _i5.PageRouteInfo<void> {
  const CreditCardListRoute({List<_i5.PageRouteInfo>? children})
      : super(
          CreditCardListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreditCardListRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.CreditCardListPage();
    },
  );
}

/// generated route for
/// [_i3.MainPage]
class MainRoute extends _i5.PageRouteInfo<void> {
  const MainRoute({List<_i5.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.MainPage();
    },
  );
}

/// generated route for
/// [_i4.PlaceHolderPage]
class PlaceHolderRoute extends _i5.PageRouteInfo<void> {
  const PlaceHolderRoute({List<_i5.PageRouteInfo>? children})
      : super(
          PlaceHolderRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlaceHolderRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.PlaceHolderPage();
    },
  );
}
