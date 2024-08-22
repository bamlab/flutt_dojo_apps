import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bam_theme/src/widgets/icons.g.dart';
import 'package:flutter_bam_theme/src/widgets/images.dart';
import 'package:flutter_bam_theme/src/widgets/loader.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:video_player/video_player.dart';

class CachedVideoControllerService {
  const CachedVideoControllerService(this._cacheManager);
  final BaseCacheManager _cacheManager;

  Future<VideoPlayerController> getControllerForVideo(
    String videoUrl, {
    VideoPlayerOptions? videoPlayerOptions,
  }) async {
    final fileInfo = await _cacheManager.getFileFromCache(videoUrl);

    if (fileInfo != null) {
      return VideoPlayerController.file(
        fileInfo.file,
        videoPlayerOptions: videoPlayerOptions,
      );
    }
    unawaited(_cacheManager.downloadFile(videoUrl));

    return VideoPlayerController.networkUrl(
      Uri.parse(videoUrl),
      videoPlayerOptions: videoPlayerOptions,
    );
  }
}

class ThemeVideo extends StatefulWidget {
  const ThemeVideo({
    required this.videoUrl,
    this.loadingBuilder,
    this.errorBuilder,
    super.key,
  });

  final String videoUrl;

  /// The widget that will be showed while the controller is initialized.
  ///
  /// If null, an [AppLoader] will be used.
  final Widget Function(BuildContext)? loadingBuilder;

  /// The widget that will be showed if the video initialization fails.
  ///
  /// If null, a [ThemeIcons.triangleexclamation_regular] will be displayed.
  final Widget Function(BuildContext)? errorBuilder;

  @override
  State<ThemeVideo> createState() => _ThemeVideoState();
}

class _ThemeVideoState extends State<ThemeVideo> {
  CacheManager? _cacheManager;
  VideoPlayerController? _controller;
  bool _hasError = false;

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    final newCacheManager = InheritedCacheManager.of(context);
    if (_cacheManager != newCacheManager) {
      _cacheManager = newCacheManager;
      await _controller?.dispose();
      await _initializeVideoController(newCacheManager);
    }
  }

  @override
  Future<void> dispose() async {
    await _cacheManager?.dispose();
    await _controller?.dispose();
    super.dispose();
  }

  Future<void> _initializeVideoController(CacheManager cacheManager) async {
    try {
      final controller = await CachedVideoControllerService(cacheManager)
          .getControllerForVideo(
        widget.videoUrl,
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      );
      await controller.initialize();
      await controller.setVolume(0);
      await controller.setLooping(true);
      await controller.play();
      if (context.mounted) {
        setState(() {
          _controller = controller;
        });
      }
    } catch (_) {
      if (context.mounted) {
        setState(() {
          _hasError = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return widget.errorBuilder?.call(context) ??
          const Center(child: Icon(ThemeIcons.triangleexclamation_regular));
    }

    final controller = _controller;
    final isInitialized = controller != null && controller.value.isInitialized;

    if (!isInitialized) {
      return widget.loadingBuilder?.call(context) ?? const AppLoader.regular();
    }

    return VideoPlayer(controller);
  }
}
