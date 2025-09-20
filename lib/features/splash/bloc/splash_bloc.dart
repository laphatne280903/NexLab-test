import 'package:injectable/injectable.dart';
import 'package:nexlabtest/base/base_bloc.dart';
import 'package:nexlabtest/features/splash/bloc/splash_state.dart';
import 'package:nexlabtest/share_components/prefs_helper.dart';

@injectable
class SplashBloc extends BaseBloc<SplashState> {
  SplashBloc({required this.sharedPrefsHelper}) : super(const SplashState());
  late final SharedPrefsHelper sharedPrefsHelper;

  Future<void> onInitSplash() async {
    emit(state.copyWith(status: SplashStatus.initial));
    final credential = await sharedPrefsHelper.getLoginCredential();

    if (credential == true) {
      emit(state.copyWith(status: SplashStatus.loggedIn));
    } else {
      emit(state.copyWith(status: SplashStatus.needToLogin));
    }
  }
}
