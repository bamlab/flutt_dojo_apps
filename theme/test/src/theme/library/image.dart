part of 'library.dart';

const _placeHolderUrl = 'https://via.placeholder.com/350x150';
ThemeSection images(BuildContext context) {
  return ThemeSection(
    title: 'Images',
    categories: [
      ThemeCategory(
        title: 'CachedImages',
        children: [
          ThemeCell(
            title: 'Default photo',
            child: InheritedCacheManager(
              child: InheritedCachedImageOverride(
                defaultAssetImage:
                    const AssetImage(ThemeAssets.ASSETS_DEFAULT_PHOTO_JPG),
                child: ImageWithFallback(
                  height: 50,
                  width: 50 * (16 / 9),
                  src: _placeHolderUrl,
                ),
              ),
            ),
          ),
          const ThemeCell(
            title: 'Placeholder',
            child: ImagePlaceHolder(
              height: 50,
              width: 50 * (16 / 9),
            ),
          ),
        ],
      ),
    ],
  );
}
