import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:photo_view/photo_view.dart';
import 'package:progressive_image/progressive_image.dart';

/// App cache manager implementation.
class AppCacheManager extends CacheManager with ImageCacheManager {
  AppCacheManager() : super(Config(defaultKey));

  static const defaultKey = 'libCachedImageData';
}

/// Establish a subtree in which cache manager resolves to the given data.
/// Use `InheritedCacheManager.of(context)` to retrieve the data
/// in any child widget.
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
    required super.child,
    super.key,
    this.cacheManagerOverride,
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

    return result?.cacheManagerOverride ?? AppCacheManager();
  }

  @override
  bool updateShouldNotify(covariant InheritedCacheManager oldWidget) =>
      oldWidget.cacheManagerOverride != cacheManagerOverride;
}

/// Establish a subtree in which [defaultAssetImage]
/// resolves to the given data. Use `InheritedCachedImageOverride.of(context)`
/// to retrieve the data in any child widget.
///
/// Typical usage is:
/// ```dart
/// InheritedCachedImageOverride(
///  overrideCachedImagesWithDefaultAssetImage: true,
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
    required super.child,
    super.key,
    this.defaultAssetImage,
  });

  /// Tells to widgets in the subtree, the default image to use
  /// to override others images.
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
  /// `defaultAssetImage` to the image you want to have in your tests.
  ImageWithFallback({
    required this.src,
    super.key,
    this.height,
    this.width,
    this.fit,
    this.imageBuilder,
    this.progressIndicatorBuilder,
    this.errorWidgetBuilder,
    this.fadeInDuration,
  }) :
        // Assert will not handle edge case in release mode. Unsupported images
        // are handled by [CachedNetworkImage] and the `errorWidget` builder.
        // The assert is here to help debug.
        assert(
          src.startsWith('https://') || src.startsWith('http://'),
          'Only image url are supported',
        );

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

  /// Builder function to create a progress indicator widget. The function is
  /// called every time a chuck of the image is downloaded from the web, but at
  /// least once during image loading.
  final Widget Function(
    BuildContext context,
    String url,
    DownloadProgress progress,
  )? progressIndicatorBuilder;

  /// Builder function to create an error widget. This builder is called when
  /// the image failed loading, for example due to a 404 NotFound exception.
  final Widget Function(
    BuildContext context,
    String url,
    dynamic error,
  )? errorWidgetBuilder;

  /// Duration of the fadeIn animation of the loaded image.
  ///
  /// If null, the duration is set to [kThemeAnimationDuration].
  final Duration? fadeInDuration;

  /// imageBuilder an imageBuilder to override the [CachedNetworkImage] with a
  /// view that can  access imageProvider.
  /// This paramater is nullable.
  final Widget Function(BuildContext context, ImageProvider imageProvider)?
      imageBuilder;

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
      imageBuilder: imageBuilder,
      fadeInDuration: fadeInDuration ?? kThemeAnimationDuration,
      fadeOutDuration: kThemeAnimationDuration,
      height: height,
      width: width,
      fit: fit,
      progressIndicatorBuilder:
          progressIndicatorBuilder ?? (_, __, ___) => const AppLoader.regular(),
      errorWidget: errorWidgetBuilder ??
          (_, __, dynamic ___) => ImagePlaceHolder(
                height: height,
                width: width,
              ),
    );
  }
}

/// Image widget to show NetworkImage with progressive loading.
class ImageWithProgress extends StatelessWidget {
  /// [ImageWithProgress] shows a network image using [ProgressiveImage] to
  /// display a progressive loading.
  ///
  /// Uses [CachedNetworkImage] to cache the images.
  ///
  /// To avoid cache errors during tests, wrap your test widget in a
  /// [InheritedCacheManager] and override the cache manager with a mock.
  ///
  /// To render an image during tests, wrap your test widget in a
  /// [InheritedCachedImageOverride], and set the property
  /// `defaultAssetImage` to the image you want to have in your tests.
  const ImageWithProgress({
    required this.thumbnailUrl,
    required this.imageUrl,
    required this.onError,
    super.key,
    this.placeholderLocalUrl,
    this.loadingBuilder,
    this.thumbnailUrlCacheKey,
    this.imageUrlCacheKey,
    this.placeholderBlur = 8,
    this.height,
    this.width,
    this.fit,
    this.onTargetImageLoaded,
  }) : assert(
          placeholderLocalUrl != null || loadingBuilder != null,
          'Either placeholderLocalUrl or loadingBuilder must be provided',
        );

  /// Url of the image to display initially while the image is loading.
  /// Has to be a local asset.
  ///
  /// For example: 'assets/images/placeholder.png'
  final String? placeholderLocalUrl;

  /// Url of the low quality image to display after the asset image while the
  /// image is loading.
  final String thumbnailUrl;

  /// Cache key of the thumbnail image.
  final String? thumbnailUrlCacheKey;

  /// Url of the high quality image.
  final String imageUrl;

  /// Cache key of the  image.
  final String? imageUrlCacheKey;

  final double placeholderBlur;

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

  final VoidCallback? onTargetImageLoaded;

  final Widget Function(BuildContext)? loadingBuilder;

  final void Function()? onError;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final defaultAssetImage = InheritedCachedImageOverride.of(context);
    if (defaultAssetImage != null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        onTargetImageLoaded?.call();
      });
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

    ImageProvider cachedNetworkImageProvider(String url, String? cacheKey) =>
        CachedNetworkImageProvider(
          url,
          cacheManager: cacheManager,
          cacheKey: cacheKey,
          errorListener: (_) => onError?.call(),
        );

    final placeholderLocalUrl = this.placeholderLocalUrl;
    final loadingBuilder = this.loadingBuilder;

    Widget placeholderBuilder(BuildContext context) {
      if (loadingBuilder != null) {
        return loadingBuilder(context);
      } else if (placeholderLocalUrl != null) {
        return ImageFiltered(
          imageFilter: ImageFilter.blur(
            sigmaX: placeholderBlur,
            sigmaY: placeholderBlur,
          ),
          child: Image.asset(
            placeholderLocalUrl,
            fit: fit,
            height: height,
            width: width,
          ),
        );
      }
      // This should never happen, because we assert that either
      // placeholderLocalUrl or loadingBuilder is not null.
      // coverage:ignore-start
      throw Exception(
        'ImageWithProgress: Either a placeholderLocalUrl or a loadingBuilder '
        'must be provided.',
      );
      // coverage:ignore-end
    }

    return AnimatedContainer(
      duration: theme.durations.xxs,
      child: ProgressiveImage.custom(
        onTargetImageLoaded: onTargetImageLoaded?.call,
        placeholderBuilder: placeholderBuilder,
        thumbnail: cachedNetworkImageProvider(
          thumbnailUrl,
          thumbnailUrlCacheKey,
        ),
        image: cachedNetworkImageProvider(
          imageUrl,
          imageUrlCacheKey,
        ),
        fadeDuration: theme.durations.xxs,
        fit: fit ?? BoxFit.scaleDown,
        width: width ?? double.infinity,
        height: height ?? double.infinity,
        blur: 3,
      ),
    );
  }
}

class ImagePlaceHolder extends StatelessWidget {
  const ImagePlaceHolder({
    super.key,
    this.height,
    this.width,
    this.child,
  });

  final double? height;
  final double? width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colors;

    final child = this.child ??
        Icon(
          Icons.image_not_supported,
          color: colors.onBackground,
        );

    return Container(
      color: colors.grey100,
      height: height,
      width: width,
      alignment: Alignment.center,
      child: child,
    );
  }
}

class AppPhotoView extends StatelessWidget {
  const AppPhotoView({
    required this.url,
    super.key,
    this.heroTag,
  });

  final String url;
  final String? heroTag;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    late ImageProvider imageProvider;

    final defaultAssetImage = InheritedCachedImageOverride.of(context);

    if (defaultAssetImage != null) {
      imageProvider = defaultAssetImage;
    } else {
      final cacheManager = InheritedCacheManager.of(context);

      imageProvider = CachedNetworkImageProvider(
        url,
        cacheManager: cacheManager,
      );
    }

    return PhotoView(
      backgroundDecoration: BoxDecoration(color: theme.colors.transparent),
      imageProvider: imageProvider,
      minScale: PhotoViewComputedScale.contained,
      heroAttributes: PhotoViewHeroAttributes(
        tag: heroTag ?? url,
        transitionOnUserGestures: true,
      ),
      errorBuilder: (_, __, ___) => const ImagePlaceHolder(
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
