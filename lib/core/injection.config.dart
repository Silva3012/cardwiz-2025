// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../application/credit_card/credit_card_bloc.dart' as _i1;
import '../repositories/implementation/credit_card_repository.dart' as _i349;
import '../repositories/interfaces/i_credit_card_repository.dart' as _i602;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i602.ICreditCardRepository>(
        () => _i349.CreditCardRepository());
    gh.lazySingleton<_i1.CreditCardBloc>(
        () => _i1.CreditCardBloc(gh<_i602.ICreditCardRepository>()));
    return this;
  }
}
