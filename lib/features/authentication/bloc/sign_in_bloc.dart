import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:nexlabtest/base/base_bloc.dart';
import 'package:nexlabtest/data/request/credential_request.dart';
import 'package:nexlabtest/domain/authentication/authentication_repository.dart';
import 'package:nexlabtest/features/authentication/bloc/sign_in_state.dart';
import 'package:nexlabtest/share_components/prefs_helper.dart';
import 'package:nexlabtest/share_widgets/validators.dart';
import 'package:nexlabtest/utils/dialog_utils.dart';

@injectable
class SignInBloc extends BaseBloc<SignInState> {
  SignInBloc({required this.authrepository, required this.prefsHelper})
    : super(const SignInState(status: SignInStatus.initial)) {
    passwordController.addListener(onValidateSignIn);
  }

  final IAuthenticationRepository authrepository;
  final SharedPrefsHelper prefsHelper;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController
      ..removeListener(onValidateSignIn)
      ..dispose();
    return super.close();
  }

  void onValidateEmail() {
    emit(state.copyWith(status: SignInStatus.inputing));
    final email = emailController.text.trim();
    final isValid = Validator.emailValid(email);
    emit(state.copyWith(isValidEmail: isValid));
  }

  void onValidateSignIn() {
    emit(state.copyWith(status: SignInStatus.inputing));
    final email = emailController.text.trim().isNotEmpty;
    final password = passwordController.text.trim().isNotEmpty;
    final isValid = email && password;
    emit(state.copyWith(isValidLogin: isValid));
  }

  Future<void> login(BuildContext context) async {
    try {
      emit(state.copyWith(status: SignInStatus.loading));
      //Fake loading time
      await Future.delayed(const Duration(seconds: 1));
      final response = await authrepository.login(
        credential: Credential(
          userName: emailController.text,
          password: passwordController.text,
        ),
      );
      if (response != null) {
        prefsHelper.saveLoginCredential(true);
        prefsHelper.saveUserInfo(response);
        emit(state.copyWith(status: SignInStatus.success));
        DialogUtils.showSuccessDialog(context, 'Đăng nhập thành công');
      } else {
        emit(
          state.copyWith(
            status: SignInStatus.fail,
            error: 'Tên đăng nhập hoặc mật khẩu sai',
          ),
        );
      }
    } catch (e) {
      Logger().e(e);
    }
  }
}
