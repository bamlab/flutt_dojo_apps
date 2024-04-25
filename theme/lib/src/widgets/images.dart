import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../../flutter_bam_theme.dart';

/// Establish a subtree in which cache manager resolves to the given data.
/// Use `InheritedCacheManager.of(context)` to retrieve the data in any child
/// widget.
///
/// Typical usage is:
/// ```dart
/// InheritedCacheManager(
///  cacheManagerOverride: MockCacheManager(),
///  child: MyWidget(),
/// );
///```
///
/// See also: [CacheManager].
class InheritedCacheManager extends InheritedWidget {
  /// Creates a widget that provides a [CacheManager] to its descendants.
  ///
  /// The [child] argument must not be null.
  const InheritedCacheManager({
    super.key,
    this.cacheManagerOverride,
    required super.child,
  });

  /// Override the default cache manager for the subtree.
  ///
  /// Default is [DefaultCacheManager].
  final CacheManager? cacheManagerOverride;

  /// The data from the closest instance of this class that encloses the given
  /// context.
  ///
  /// You can use this method to retrieve the [CacheManager].
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// final cacheManager = InheritedCacheManager.of(context);
  /// ```
  static CacheManager of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<InheritedCacheManager>();

    return result?.cacheManagerOverride ?? DefaultCacheManager();
  }

  @override
  bool updateShouldNotify(covariant InheritedCacheManager oldWidget) =>
      oldWidget.cacheManagerOverride != cacheManagerOverride;
}

/// Establish a subtree in which [defaultAssetImage] resolves to the given data.
/// Use `InheritedCachedImageOverride.of(context) to retrieve the data in any
/// child widget.
///
/// Typical usage is:
/// ```dart
/// InheritedCachedImageOverride(
///  defaultAssetImage: AssetImage(
///     'assets/default_photo.jpg',
///     package: 'flutter_bam_theme',
///     ),
///  child: MyWidget(),
/// );
///```
///
/// See also: [ImageWithFallback].
class InheritedCachedImageOverride extends InheritedWidget {
  /// Creates a widget that provides [defaultAssetImage]
  /// to its descendants.
  ///
  /// The [child] argument must not be null.
  const InheritedCachedImageOverride({
    super.key,
    this.defaultAssetImage,
    required super.child,
  });

  /// Tells to widgets in the subtree, the default image to use to override
  /// others images.
  final AssetImage? defaultAssetImage;

  /// The data from the closest instance of this class that encloses the given
  /// context.
  ///
  /// You can use this method to know if an Image should be overridden.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// final defaultImage = InheritedCachedImageOverride.of(context);
  /// ```
  static AssetImage? of(BuildContext context) {
    final result = context
        .dependOnInheritedWidgetOfExactType<InheritedCachedImageOverride>();

    return result?.defaultAssetImage;
  }

  @override
  bool updateShouldNotify(covariant InheritedCachedImageOverride oldWidget) =>
      oldWidget.defaultAssetImage != defaultAssetImage;
}

/// Image widget to show NetworkImage with caching and mock functionalities.
class ImageWithFallback extends StatelessWidget {
  /// ImageWithFallback shows a network image using a caching mechanism. It also
  /// handles images errors by displaying an [ImagePlaceHolder].
  ///
  /// To avoid cache errors during tests, wrap your test widget in a
  /// [InheritedCacheManager] and override the cache manager with a mock.
  ///
  /// To render an image during tests, wrap your test widget in a
  /// [InheritedCachedImageOverride], and set the property
  /// `defaultAssetImage` to your wanted assetImage.
  ImageWithFallback({
    super.key,
    required this.src,
    this.height,
    this.width,
    this.fit,
  }) :
        // Assert will not handle edge case in release mode. Unsupported images
        // are handled by [CachedNetworkImage] and the `errorWidget` builder.
        // The assert is here to help debug.
        assert(src.startsWith('https://'), 'Only image url are supported');

  /// Image source. For now, only url are supported.
  final String src;

  ///   If non-null, require the image to have this height.
  ///
  /// If null, the image will pick a size that best preserves its intrinsic
  /// aspect ratio. This may result in a sudden change if the size of the
  /// placeholder widget does not match that of the target image. The size is
  /// also affected by the scale factor.
  final double? height;

  /// If non-null, require the image to have this width.
  ///
  /// If null, the image will pick a size that best preserves its intrinsic
  /// aspect ratio. This may result in a sudden change if the size of the
  /// placeholder widget does not match that of the target image. The size is
  /// also affected by the scale factor.
  final double? width;

  /// How to inscribe the image into the space allocated during layout.
  ///
  /// The default varies based on the other fields. See the discussion at
  /// [paintImage].
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final defaultAssetImage = InheritedCachedImageOverride.of(context);
    if (defaultAssetImage != null) {
      return Image.asset(
        defaultAssetImage.assetName,
        height: height,
        width: width,
        fit: fit,
        package: defaultAssetImage.package,
        bundle: defaultAssetImage.bundle,
      );
    }

    final cacheManager = InheritedCacheManager.of(context);

    return CachedNetworkImage(
      imageUrl: src,
      cacheManager: cacheManager,
      fadeInDuration: kThemeAnimationDuration,
      fadeOutDuration: kThemeAnimationDuration,
      height: height,
      width: width,
      fit: fit,
      errorWidget: (_, __, dynamic ___) => ImagePlaceHolder(
        height: height,
        width: width,
      ),
    );
  }
}

/// Widget used to show a placeholder instead of an image
///
/// It can be used on error cases or if no image is provided
class ImagePlaceHolder extends StatelessWidget {
  /// default constructor.
  const ImagePlaceHolder({
    super.key,
    this.height,
    this.width,
  });

  /// height of the [ImagePlaceHolder]
  final double? height;

  /// width of the [ImagePlaceHolder]
  final double? width;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colors;

    return Container(
      color: colors.background,
      height: height,
      width: width,
      alignment: Alignment.center,
      child: Icon(
        Icons.image_not_supported,
        color: colors.onBackground,
      ),
    );
  }
}
