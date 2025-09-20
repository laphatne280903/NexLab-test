import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double? radius;
  final BoxFit? fit;
  final BoxShape? shape;
  final ImageWidgetBuilder? imageBuilder;
  final Widget? errorWidget;
  final Widget? placeholderWidget;
  final Alignment? alignment;
  final bool useBuilder;

  const CachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.radius,
    this.fit,
    this.shape,
    this.imageBuilder,
    this.errorWidget,
    this.placeholderWidget,
    this.alignment,
    this.useBuilder = true,
  });

  BorderRadius? get _borderRadius {
    if (shape == BoxShape.circle) return null;
    return BorderRadius.circular(radius ?? 0);
  }

  ImageWidgetBuilder get _defaultImageBuilder => (
        BuildContext context,
        ImageProvider<Object> imageProvider,
      ) {
        return DecoratedBox(
          decoration: BoxDecoration(
            shape: shape ?? BoxShape.rectangle,
            borderRadius: _borderRadius,
            image: DecorationImage(
              image: imageProvider,
              alignment: alignment ?? Alignment.center,
              fit: fit ?? BoxFit.cover,
            ),
          ),
        );
      };

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) return getErrorWidget();

    final imageWidget = CachedNetworkImage(
      key: ValueKey(imageUrl),
      imageUrl: imageUrl,
      cacheKey: imageUrl,
      imageBuilder: useBuilder ? (imageBuilder ?? _defaultImageBuilder) : null,
      width: width,
      height: height,
      alignment: alignment ?? Alignment.center,
      fit: fit ?? BoxFit.cover,
      errorWidget: (_, __, ___) => getErrorWidget(),
    );

    if (!useBuilder) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0),
        child: imageWidget,
      );
    }

    return imageWidget;
  }

  Widget getErrorWidget() {
    return Container(
      width: width,
      height: height,
      padding: errorWidget == null ? REdgeInsets.all(4) : null,
      decoration: BoxDecoration(
        shape: shape ?? BoxShape.rectangle,
        borderRadius: _borderRadius,
      ),
      clipBehavior: Clip.hardEdge,
      child: Center(
        child: errorWidget ??
            const AspectRatio(
              aspectRatio: .3,
              child: FittedBox(
                child: CupertinoActivityIndicator(
                  animating: true,
                  radius: 30,
                ),
              ),
            ),
      ),
    );
  }
}
