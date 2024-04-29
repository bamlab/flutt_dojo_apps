import 'dart:async';

import 'package:flutter_bam_theme/cdapp_theme.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:video_player/video_player.dart';

@visibleForTesting
class CachedVideoControllerService {
  CachedVideoControllerService(this._cacheManager);
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
    super.key,
    required this.videoUrl,
    this.loadingBuilder,
    this.errorBuilder,
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
  CacheManager? cacheManager;
  VideoPlayerController? _controller;
  bool hasError = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final newCacheManager = InheritedCacheManager.of(context);
    if (cacheManager != newCacheManager) {
      cacheManager = newCacheManager;
      _controller?.dispose();
      _initializeVideoController(newCacheManager);
    }
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
      setState(() {
        _controller = controller;
      });
    } catch (e) {
      setState(() {
        hasError = true;
      });
      return;
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (hasError) {
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
