import 'dart:async';

import 'package:adaptive_test/adaptive_test.dart';
import 'package:ci/ci.dart';
import 'package:flutter_test/flutter_test.dart';

final defaultDeviceConfigs = {
  iPhone8,
  iPhone13,
  iPadPro,
  desktop,
  pixel5,
};

const _goldenTestsThreshold = 0.03 / 100; // 0.03%

/// Workaround to prevent golden tests to fail on CI because of platform
/// rendering differences.
const _goldenTestsCIThreshold = 8 / 100; // 8%

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  TestWidgetsFlutterBinding.ensureInitialized();
  AdaptiveTestConfiguration.instance.setDeviceVariants(defaultDeviceConfigs);
  await loadFontsFromPackage(
    package: Package(name: 'flutter_bam_theme', relativePath: '.'),
  );

  final threshold = isCI ? _goldenTestsCIThreshold : _goldenTestsThreshold;

  setupFileComparatorWithThreshold(threshold);

  await testMain();
}
