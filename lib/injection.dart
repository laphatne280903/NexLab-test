import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

// ignore: inference_failure_on_function_return_type
@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: false, // default
  asExtension: false,
)
// ignore: always_declare_return_types
Future<void> configureDependencies() async => $initGetIt(getIt);
