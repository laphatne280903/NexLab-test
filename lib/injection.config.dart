// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:nexlabtest/core/modules.dart' as _i68;
import 'package:nexlabtest/data/service/authentication/authentication_service.dart'
    as _i556;
import 'package:nexlabtest/data/service/contact/contact_service.dart' as _i566;
import 'package:nexlabtest/domain/authentication/authentication_repository.dart'
    as _i611;
import 'package:nexlabtest/domain/contact/contact_repository.dart' as _i212;
import 'package:nexlabtest/features/authentication/bloc/sign_in_bloc.dart'
    as _i439;
import 'package:nexlabtest/features/contact/bloc/contact_bloc.dart' as _i490;
import 'package:nexlabtest/features/splash/bloc/splash_bloc.dart' as _i92;
import 'package:nexlabtest/share_components/prefs_helper.dart' as _i773;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final injectionModule = _$InjectionModule();
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => injectionModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i556.IAuthenticationService>(
    () => _i556.AuthenticationService(),
  );
  gh.lazySingleton<_i566.IContactService>(() => _i566.ContactService());
  gh.singleton<_i773.SharedPrefsHelper>(
    () => _i773.SharedPrefsHelper(prefs: gh<_i460.SharedPreferences>()),
  );
  gh.lazySingleton<_i611.IAuthenticationRepository>(
    () => _i611.AuthenticationRepository(
      client: gh<_i556.IAuthenticationService>(),
    ),
  );
  gh.lazySingleton<_i212.IContactRepository>(
    () => _i212.ContactRepository(service: gh<_i566.IContactService>()),
  );
  gh.factory<_i92.SplashBloc>(
    () => _i92.SplashBloc(sharedPrefsHelper: gh<_i773.SharedPrefsHelper>()),
  );
  gh.factory<_i439.SignInBloc>(
    () => _i439.SignInBloc(
      authrepository: gh<_i611.IAuthenticationRepository>(),
      prefsHelper: gh<_i773.SharedPrefsHelper>(),
    ),
  );
  gh.factory<_i490.ContactBloc>(
    () => _i490.ContactBloc(
      sharedPrefsHelper: gh<_i773.SharedPrefsHelper>(),
      contactRepository: gh<_i212.IContactRepository>(),
    ),
  );
  return getIt;
}

class _$InjectionModule extends _i68.InjectionModule {}
