import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nexlabtest/gen/assets.gen.dart';
import 'package:nexlabtest/utils/color_utils.dart';
import 'package:nexlabtest/utils/text_style_utils.dart';
import 'package:toastification/toastification.dart';

class DialogUtils {
  static showSuccessDialog(BuildContext context, String message) {
    if (message.isEmpty) return;

    toastification.show(
      context: context,
      title: Text(
        message,
        style: TextStyleUtils.getBodyMediumTextRegular(
          color: IStaticColors.white,
        ),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      autoCloseDuration: Duration(seconds: 3),
      showProgressBar: false,
      type: ToastificationType.success,
      backgroundColor: IStaticColors.green057Color,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.only(left: 16, right: 4),
      showIcon: false,
      closeButton: ToastCloseButton(
        buttonBuilder: (context, onClose) => IconButton(
          onPressed: onClose,
          icon: Assets.icons.closeWhite.svg(
            color: IStaticColors.white,
            height: 18.h,
            width: 18.w,
          ),
        ),
      ),
    );
  }

  static showErrorDialog(BuildContext context, String message) {
    if (message.isEmpty) return;

    toastification.show(
      context: context,
      title: Text(
        message,
        style: TextStyleUtils.getBodyMediumTextRegular(
          color: IStaticColors.white,
        ),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      autoCloseDuration: Duration(seconds: 3),
      showProgressBar: false,
      type: ToastificationType.error,
    );
  }
}
