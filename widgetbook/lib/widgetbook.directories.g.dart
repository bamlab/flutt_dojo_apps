// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dojo_widgetbook/atom/card.dart' as _i5;
import 'package:dojo_widgetbook/data/colors.dart' as _i2;
import 'package:dojo_widgetbook/molecule/app_error_view.dart' as _i3;
import 'package:dojo_widgetbook/molecule/app_loading_view.dart' as _i4;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookCategory(
    name: 'data',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'ColoredBox',
        useCase: _i1.WidgetbookUseCase(
          name: 'colors data',
          builder: _i2.colors,
        ),
      )
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'view',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'AppErrorView',
        useCase: _i1.WidgetbookUseCase(
          name: 'App error view',
          builder: _i3.appErrorView,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'AppLoadingView',
        useCase: _i1.WidgetbookUseCase(
          name: 'App lodaing view',
          builder: _i4.appLoadingView,
        ),
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'widgets',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'AppCard',
        useCase: _i1.WidgetbookUseCase(
          name: 'Card',
          builder: _i5.evToggle,
        ),
      )
    ],
  ),
];
