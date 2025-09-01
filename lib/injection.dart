import 'package:cardwiz/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final cardWizSl = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async => cardWizSl.init();

// @module
// abstract class RegisterDependencies {
//   @lazySingleton
//   ICreditCardRepository get creditCardRepository => CreditCardRepository();
// }
