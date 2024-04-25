import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/src/utils/named.dart';
import 'package:flutter_bam_theme/src/widgets/buttons.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_theme.dart';

void main() {
  ValueVariant<Named<ThemeButton>> buttonVariant({
    bool disabled = false,
    bool loading = false,
    String? label,
    bool icon = false,
    bool isFullWidth = false,
  }) =>
      ValueVariant(
        {
          ThemeButton.primary(
            onPressed: disabled ? null : () {},
            isLoading: loading,
            label: label,
            icon: icon ? Icons.circle : null,
            isFullWidth: isFullWidth,
          ).named('primary'),
          ThemeButton.secondary(
            onPressed: disabled ? null : () {},
            isLoading: loading,
            label: label,
            icon: icon ? Icons.circle : null,
            isFullWidth: isFullWidth,
          ).named('secondary'),
          ThemeButton.tertiary(
            onPressed: disabled ? null : () {},
            isLoading: loading,
            label: label,
            icon: icon ? Icons.circle : null,
            isFullWidth: isFullWidth,
          ).named('tertiary'),
        },
      );
  group(ThemeButton, () {
    group('with only a label', () {
      final labelOnlyVariant = buttonVariant(label: 'Button');
      testWidgets(
        'should render for every constructor',
        (tester) async {
          final widget = Scaffold(
            body: Center(
              child: labelOnlyVariant.currentValue?.value,
            ),
          );

          await tester.pumpTheme(widget);

          await expectLater(
            find.byType(ThemeButton),
            matchesGoldenFile(
              'goldens/buttons/${labelOnlyVariant.currentValue?.name}/only_label.png',
            ),
          );
        },
        variant: labelOnlyVariant,
      );

      final labelOnlyFullWidthVariant =
          buttonVariant(label: 'Button', isFullWidth: true);
      testWidgets(
        'should render in full width for every constructor',
        (tester) async {
          final widget = Scaffold(
            body: Center(
              child: labelOnlyFullWidthVariant.currentValue?.value,
            ),
          );

          await tester.pumpTheme(widget);

          await expectLater(
            find.byType(ThemeButton),
            matchesGoldenFile(
              'goldens/buttons/${labelOnlyFullWidthVariant.currentValue?.name}/only_label_full_width.png',
            ),
          );
        },
        variant: labelOnlyFullWidthVariant,
      );

      final labelOnlyDisabledVariant =
          buttonVariant(label: 'Button', disabled: true);
      testWidgets(
        'should render disabled for every constructor',
        (tester) async {
          final widget = Scaffold(
            body: Center(
              child: labelOnlyDisabledVariant.currentValue?.value,
            ),
          );

          await tester.pumpTheme(widget);

          await expectLater(
            find.byType(ThemeButton),
            matchesGoldenFile(
              'goldens/buttons/${labelOnlyDisabledVariant.currentValue?.name}/only_label_disabled.png',
            ),
          );
        },
        variant: labelOnlyDisabledVariant,
      );

      final labelOnlyLoadingVariant =
          buttonVariant(label: 'Button', loading: true);
      testWidgets(
        'should render loading for every constructor',
        (tester) async {
          final widget = Scaffold(
            body: Center(
              child: labelOnlyLoadingVariant.currentValue?.value,
            ),
          );

          await tester.pumpTheme(widget);

          await expectLater(
            find.byType(ThemeButton),
            matchesGoldenFile(
              'goldens/buttons/${labelOnlyLoadingVariant.currentValue?.name}/only_label_loading.png',
            ),
          );
        },
        variant: labelOnlyLoadingVariant,
      );
    });

    group('with only an icon', () {
      final iconOnlyVariant = buttonVariant(icon: true);
      testWidgets(
        'should render for every constructor',
        (tester) async {
          final widget = Scaffold(
            body: Center(
              child: iconOnlyVariant.currentValue?.value,
            ),
          );

          await tester.pumpTheme(widget);

          await expectLater(
            find.byType(ThemeButton),
            matchesGoldenFile(
              'goldens/buttons/${iconOnlyVariant.currentValue?.name}/only_icon.png',
            ),
          );
        },
        variant: iconOnlyVariant,
      );

      final iconOnlyDisabledVariant = buttonVariant(icon: true, disabled: true);
      testWidgets(
        'should render disabled for every constructor',
        (tester) async {
          final widget = Scaffold(
            body: Center(
              child: iconOnlyDisabledVariant.currentValue?.value,
            ),
          );

          await tester.pumpTheme(widget);

          await expectLater(
            find.byType(ThemeButton),
            matchesGoldenFile(
              'goldens/buttons/${iconOnlyDisabledVariant.currentValue?.name}/only_icon_disabled.png',
            ),
          );
        },
        variant: iconOnlyDisabledVariant,
      );

      final iconOnlyLoadingVariant = buttonVariant(icon: true, loading: true);
      testWidgets(
        'should render loading for every constructor',
        (tester) async {
          final widget = Scaffold(
            body: Center(
              child: iconOnlyLoadingVariant.currentValue?.value,
            ),
          );

          await tester.pumpTheme(widget);

          await expectLater(
            find.byType(ThemeButton),
            matchesGoldenFile(
              'goldens/buttons/${iconOnlyLoadingVariant.currentValue?.name}/only_icon_loading.png',
            ),
          );
        },
        variant: iconOnlyLoadingVariant,
      );
    });

    group('with a label and an icon', () {
      final labelAndIconVariant = buttonVariant(label: 'Button', icon: true);
      testWidgets(
        'should render for every constructor',
        (tester) async {
          final widget = Scaffold(
            body: Center(
              child: labelAndIconVariant.currentValue?.value,
            ),
          );

          await tester.pumpTheme(widget);

          await expectLater(
            find.byType(ThemeButton),
            matchesGoldenFile(
              'goldens/buttons/${labelAndIconVariant.currentValue?.name}/label_and_icon.png',
            ),
          );
        },
        variant: labelAndIconVariant,
      );

      final labelAndIconDisabledVariant =
          buttonVariant(label: 'Button', icon: true, disabled: true);
      testWidgets(
        'should render disabled for every constructor',
        (tester) async {
          final widget = Scaffold(
            body: Center(
              child: labelAndIconDisabledVariant.currentValue?.value,
            ),
          );

          await tester.pumpTheme(widget);

          await expectLater(
            find.byType(ThemeButton),
            matchesGoldenFile(
              'goldens/buttons/${labelAndIconDisabledVariant.currentValue?.name}/label_and_icon_disabled.png',
            ),
          );
        },
        variant: labelAndIconDisabledVariant,
      );

      final labelAndIconLoadingVariant =
          buttonVariant(label: 'Button', icon: true, loading: true);
      testWidgets(
        'should render loading for every constructor',
        (tester) async {
          final widget = Scaffold(
            body: Center(
              child: labelAndIconLoadingVariant.currentValue?.value,
            ),
          );

          await tester.pumpTheme(widget);

          await expectLater(
            find.byType(ThemeButton),
            matchesGoldenFile(
              'goldens/buttons/${labelAndIconLoadingVariant.currentValue?.name}/label_and_icon_loading.png',
            ),
          );
        },
        variant: labelAndIconLoadingVariant,
      );
    });
  });
}
