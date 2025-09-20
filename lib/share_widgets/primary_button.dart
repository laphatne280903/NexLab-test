import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexlabtest/utils/color_utils.dart';
import 'package:nexlabtest/utils/text_style_utils.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final Widget? icon;
  final Widget? rightIcon;
  final double? buttonHeight;
  final TextStyle? textStyle;
  final double? width;
  final bool isActive;
  final double? radius;
  final bool allowDisableClick;
  final Function? onClick;
  final bool isFlexibleWidth;
  final EdgeInsets? padding;
  final double? iconSpacing;
  final Color? backgroundColor;
  final BoxBorder? border;

  const PrimaryButton({
    required this.text,
    required this.onClick,
    this.buttonHeight,
    this.radius,
    this.textStyle,
    this.width,
    this.icon,
    this.rightIcon,
    this.isActive = true,
    this.allowDisableClick = false,
    this.isFlexibleWidth = false,
    this.padding,
    this.iconSpacing,
    this.backgroundColor,
    this.border,
    super.key,
  });

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _isButtonDisabled = false;

  double get _defaultRadius => 50.r;

  double get _defaultHeight => 51.h;

  void _handleTap() {
    if (!_isButtonDisabled) {
      print("PrimaryButtonState: call button click");
      widget.onClick?.call();
      setState(() {
        _isButtonDisabled = true;
      });
      Timer(const Duration(milliseconds: 500), () {
        if (mounted) {
          setState(() {
            _isButtonDisabled = false;
            print("PrimaryButtonState: enable button");
          });
        }
      });
    } else {
      print("PrimaryButtonState: button is disabled");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(widget.radius ?? _defaultRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(widget.radius ?? _defaultRadius),
        onTap: !widget.isActive && !widget.allowDisableClick
            ? null
            : _isButtonDisabled
            ? null
            : _handleTap,
        child: Ink(
          padding: widget.padding ?? REdgeInsets.symmetric(horizontal: 8),
          height: widget.buttonHeight ?? _defaultHeight,
          width: widget.width,
          decoration: BoxDecoration(
            border: widget.border,
            color:
                widget.backgroundColor ??
                (!widget.isActive
                    ? IStaticColors.grayLightEFEFEF
                    : IStaticColors.primaryColor),
            borderRadius: BorderRadius.all(
              Radius.circular(widget.radius ?? _defaultRadius),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: widget.isFlexibleWidth
                ? MainAxisSize.min
                : MainAxisSize.max,
            children: [
              if (widget.icon != null) ...[
                widget.icon!,
                widget.iconSpacing != null
                    ? widget.iconSpacing!.horizontalSpace
                    : 6.horizontalSpace,
              ],
              Text(
                widget.text,
                style:
                    widget.textStyle ??
                    TextStyleUtils.getBodyLargeTextBold(
                      color: widget.isActive
                          ? IStaticColors.buttonColor
                          : widget.allowDisableClick
                          ? Colors.black
                          : IStaticColors.gray585858,
                    ),
              ),
              if (widget.rightIcon != null) ...[
                6.horizontalSpace,
                widget.rightIcon!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
