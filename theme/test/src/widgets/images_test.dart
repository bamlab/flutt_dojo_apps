import 'package:flutter_bam_theme/flutter_bam_theme.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_theme.dart';
import '../../mocks/mocks.dart';

void main() {
  testWidgets('$ImageWithFallback renders placeholder on error',
      (tester) async {
    final mockCacheManager = MockCacheManager();

    when(() => mockCacheManager.getImageFile(any(), withProgress: true))
        .thenThrow(Exception());

    final widget = InheritedCacheManager(
      cacheManagerOverride: mockCacheManager,
      child: ImageWithFallback(
        height: 50,
        width: 50,
        src: 'https://fake_image.png',
      ),
    );

    await tester.pumpTheme(widget);
    await tester.pumpAndSettle();

    expect(find.byType(ImagePlaceHolder), findsOneWidget);
  });
}
