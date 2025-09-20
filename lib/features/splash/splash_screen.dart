import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nexlabtest/features/authentication/sign_in_screen.dart';
import 'package:nexlabtest/features/contact/contact_screen.dart';
import 'package:nexlabtest/features/splash/bloc/splash_bloc.dart';
import 'package:nexlabtest/features/splash/bloc/splash_state.dart';
import 'package:nexlabtest/gen/assets.gen.dart';
import 'package:nexlabtest/injection.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late SplashBloc bloc = getIt<SplashBloc>();
    return BlocConsumer<SplashBloc, SplashState>(
      bloc: bloc,
      listener: (context, state) {
        if (state.status == SplashStatus.loggedIn) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SignInScreen()),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(seconds: 3),
                  curve: Curves.easeIn,
                  builder: (context, value, child) {
                    return Opacity(opacity: value, child: child);
                  },
                  child: Center(
                    child: Assets.icons.logoSplashSvg.svg(
                      width: MediaQuery.of(context).size.width * 0.5
                    ),
                  ),
                  onEnd: () {
                    bloc.onInitSplash();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
