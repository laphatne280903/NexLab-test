import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key, this.size});
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size ?? 60.r,
      height: size ?? 60.r,
      child: const LoadingIndicator(
        indicatorType: Indicator.ballRotateChase,
        colors: [
          Color(0xFFFF6F00), 
          Color(0xFFFF6F00),
          Color(0xFFFF8F00), 
          Color(0xFFFFC107), 
          Color(0xFFFFC107),
          Color(0xFFFFD54F), 
          Color(0xFFFFD54F),
        ],
        strokeWidth: 2,
        backgroundColor: Colors.transparent,
        pathBackgroundColor: Colors.transparent,
      ),
    );
  }
}
