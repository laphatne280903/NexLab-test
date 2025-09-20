import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:nexlabtest/features/authentication/bloc/sign_in_bloc.dart';
import 'package:nexlabtest/features/authentication/bloc/sign_in_state.dart';
import 'package:nexlabtest/features/contact/contact_screen.dart';
import 'package:nexlabtest/gen/assets.gen.dart';
import 'package:nexlabtest/injection.dart';
import 'package:nexlabtest/share_widgets/loading_indicator.dart';
import 'package:nexlabtest/share_widgets/primary_button.dart';
import 'package:nexlabtest/utils/color_utils.dart';
import 'package:nexlabtest/utils/text_style_utils.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late SignInBloc bloc;
  bool isObscure = true;

  @override
  void initState() {
    bloc = getIt<SignInBloc>();
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      bloc: bloc,
      listener: (context, state) {
        if (state.status == SignInStatus.success) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
      },
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.isValidEmail != current.isValidEmail ||
          previous.isValidLogin != current.isValidLogin ||
          previous.error != current.error,
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              body: GestureDetector(
                onTap: () {
                  FocusManager.instance.primaryFocus!.unfocus();
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: IStaticColors.primaryGradient,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          padding: REdgeInsets.symmetric(horizontal: 12.r),
                          child: Column(
                            spacing: 12,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Assets.icons.logoSplashSvg.svg(height: 30.r),
                              SizedBox(height: 8.h),
                              Text(
                                'Đăng nhập vào tài khoản của bạn',
                                style: TextStyleUtils.getHeading1Bold(
                                  color: IStaticColors.white,
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Chưa có tài khoản? ',
                                      style:
                                          TextStyleUtils.getBodyMediumTextRegular(
                                            color: IStaticColors.black,
                                          ),
                                    ),
                                    TextSpan(
                                      text: 'Đăng ký ngay',
                                      style:
                                          TextStyleUtils.getBodyMediumTextRegular(
                                            color: IStaticColors
                                                .white, // ví dụ màu cam nổi bật
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      //Email input
                      Expanded(
                        flex: 6,
                        child: SingleChildScrollView(
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            padding: REdgeInsets.symmetric(
                              horizontal: 16.r,
                              vertical: 36.r,
                            ),
                            decoration: BoxDecoration(
                              color: IStaticColors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12.r),
                                topRight: Radius.circular(12.r),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 12,
                              children: [
                                Text(
                                  'Email',
                                  style: TextStyleUtils.getBodySmallTextBold(),
                                ),
                                TextField(
                                  controller: bloc.emailController,
                                  style:
                                      TextStyleUtils.getBodyMediumTextRegular(),
                                  decoration: InputDecoration(
                                    hintText: 'Nhập email',
                                    hintStyle:
                                        TextStyleUtils.getBodyMediumTextRegular(
                                          color: IStaticColors.gray585858,
                                        ),
                                    contentPadding: REdgeInsets.symmetric(
                                      horizontal: 12.r,
                                      vertical: 12.r,
                                    ),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.r,
                                      ), // canh lề icon
                                      child: Icon(
                                        Icons.email_outlined,
                                        color: IStaticColors.gray585858,
                                      ),
                                    ),
                                    prefixIconConstraints: BoxConstraints(
                                      minWidth: 24,
                                      minHeight: 24,
                                    ),
                                    filled: true,
                                    fillColor: IStaticColors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: IStaticColors.grayD6D6D6,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: IStaticColors.orangeFE8019,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    bloc.onValidateEmail();
                                  },
                                ),
                                if (state.status != SignInStatus.initial &&
                                    (!state.isValidEmail ||
                                        state.error != null)) ...[
                                  Row(
                                    spacing: 6,
                                    children: [
                                      Icon(
                                        Icons.warning_amber_rounded,
                                        color: IStaticColors.redFF2B2E,
                                      ),
                                      Text(
                                        state.error ?? 'Email không hợp lệ',
                                        style:
                                            TextStyleUtils.getBodySmallTextRegular(
                                              color: IStaticColors.redFF2B2E,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                                Text(
                                  'Mật khẩu',
                                  style: TextStyleUtils.getBodySmallTextBold(),
                                ),

                                //Password input
                                TextField(
                                  controller: bloc.passwordController,
                                  style:
                                      TextStyleUtils.getBodyMediumTextRegular(),
                                  obscureText: isObscure,
                                  decoration: InputDecoration(
                                    hintText: 'Mật khẩu',
                                    hintStyle:
                                        TextStyleUtils.getBodyMediumTextRegular(
                                          color: IStaticColors.gray585858,
                                        ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isObscure = !isObscure;
                                        });
                                      },
                                      icon: isObscure
                                          ? Icon(Icons.visibility_outlined)
                                          : Icon(Icons.visibility_off_outlined),
                                    ),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.r,
                                      ), // canh lề icon
                                      child: Icon(
                                        Icons.lock,
                                        color: IStaticColors.gray585858,
                                      ),
                                    ),
                                    prefixIconConstraints: BoxConstraints(
                                      minWidth: 24,
                                      minHeight: 24,
                                    ),
                                    contentPadding: REdgeInsets.symmetric(
                                      horizontal: 12.r,
                                      vertical: 12.r,
                                    ),
                                    filled: true,
                                    fillColor: IStaticColors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: IStaticColors.grayD6D6D6,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: IStaticColors.orangeFE8019,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),

                                //Forget password
                                TextButton(
                                  onPressed: () {
                                    //TODO: Add forget password feat
                                  },
                                  child: Text(
                                    'Quên mật khẩu?',
                                    style: TextStyleUtils.getBodySmallTextBold(
                                      color: IStaticColors.orangeFE8019,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                PrimaryButton(
                                  isActive: state.isValidLogin,
                                  text: 'Đăng nhập',
                                  onClick: () async {
                                    await bloc.login(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            state.status == SignInStatus.loading
                ? Center(child: AppLoadingIndicator())
                : const SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
