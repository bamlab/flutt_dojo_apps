// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:design_system/atom/buttons.dart' as _i23;
import 'package:design_system/atom/card_badge.dart' as _i9;
import 'package:design_system/atom/chip.dart' as _i6;
import 'package:design_system/atom/datepicker.dart' as _i24;
import 'package:design_system/atom/dropdown.dart' as _i25;
import 'package:design_system/atom/ev_itinerary_marker.dart' as _i15;
import 'package:design_system/atom/icon_box.dart' as _i13;
import 'package:design_system/atom/instruction_message.dart' as _i16;
import 'package:design_system/atom/modal.dart' as _i17;
import 'package:design_system/atom/partners_buttons.dart' as _i18;
import 'package:design_system/atom/poi_distinctions.dart' as _i11;
import 'package:design_system/atom/poi_markers.dart' as _i14;
import 'package:design_system/atom/sliders.dart' as _i26;
import 'package:design_system/atom/snackbar.dart' as _i22;
import 'package:design_system/atom/tab_bar.dart' as _i27;
import 'package:design_system/atom/text_field.dart' as _i7;
import 'package:design_system/atom/toggle.dart' as _i29;
import 'package:design_system/atom/zoi_card.dart' as _i30;
import 'package:design_system/data/border_radius.dart' as _i12;
import 'package:design_system/data/card.dart' as _i5;
import 'package:design_system/data/colors.dart' as _i10;
import 'package:design_system/data/gap.dart' as _i8;
import 'package:design_system/data/text.dart' as _i28;
import 'package:design_system/molecule/cta_marker.dart' as _i32;
import 'package:design_system/molecule/ev_toggle.dart' as _i31;
import 'package:design_system/molecule/itinerary_summary_bar.dart' as _i2;
import 'package:design_system/molecule/poi_highlight.dart' as _i19;
import 'package:design_system/molecule/poi_toolbar.dart' as _i3;
import 'package:design_system/molecule/promo_card.dart' as _i20;
import 'package:design_system/molecule/route_card_ev_bar.dart' as _i4;
import 'package:design_system/molecule/route_marker.dart' as _i33;
import 'package:design_system/molecule/segment_control.dart' as _i21;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'material',
    children: [
      _i1.WidgetbookComponent(
        name: 'Card',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Itinerary Summary Bar',
            builder: _i2.itinerarySummaryBar,
          ),
          _i1.WidgetbookUseCase(
            name: 'Poi Toolbar',
            builder: _i3.poiToolbar,
          ),
          _i1.WidgetbookUseCase(
            name: 'RouteCard EV bar',
            builder: _i4.routeCardEVBar,
          ),
          _i1.WidgetbookUseCase(
            name: 'ThemeCard',
            builder: _i5.themeCard,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'Chip',
        useCase: _i1.WidgetbookUseCase(
          name: 'chips',
          builder: _i6.chips,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'TextField',
        useCase: _i1.WidgetbookUseCase(
          name: 'Form TextInput',
          builder: _i7.textField,
        ),
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'widgets',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'AppGap',
        useCase: _i1.WidgetbookUseCase(
          name: 'AppGap',
          builder: _i8.gaps,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'CardBadge',
        useCase: _i1.WidgetbookUseCase(
          name: 'Card Badge',
          builder: _i9.cardBage,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'ColoredBox',
        useCase: _i1.WidgetbookUseCase(
          name: 'Colors',
          builder: _i10.colorUseCase,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'Container',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'POI Distinctions',
            builder: _i11.poiDistinctions,
          ),
          _i1.WidgetbookUseCase(
            name: 'border radius',
            builder: _i12.borderRadiusUseCase,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'IconBox',
        useCase: _i1.WidgetbookUseCase(
          name: 'Icon box',
          builder: _i13.iconBox,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'Image',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Address Marker',
            builder: _i14.addressMarkers,
          ),
          _i1.WidgetbookUseCase(
            name: 'EV itinerary marker',
            builder: _i15.evItineraryMarker,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'InstructionMessage',
        useCase: _i1.WidgetbookUseCase(
          name: 'Instruction message',
          builder: _i16.instructionMessage,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'ModalBody',
        useCase: _i1.WidgetbookUseCase(
          name: 'Modal',
          builder: _i17.modal,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'PartnerButton',
        useCase: _i1.WidgetbookUseCase(
          name: 'Partner buttons',
          builder: _i18.partnerButtons,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'PoiHighlight',
        useCase: _i1.WidgetbookUseCase(
          name: 'poi highlight',
          builder: _i19.poiHighlight,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'PromoCard',
        useCase: _i1.WidgetbookUseCase(
          name: 'Promo card',
          builder: _i20.promoCard,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'SegmentControlSelection',
        useCase: _i1.WidgetbookUseCase(
          name: 'Segment control',
          builder: _i21.segmentControl,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'SnackBarBody',
        useCase: _i1.WidgetbookUseCase(
          name: 'Snackbars',
          builder: _i22.snackbarUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'ThemeButton',
        useCase: _i1.WidgetbookUseCase(
          name: 'Buttons',
          builder: _i23.buttons,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'ThemeDatePicker',
        useCase: _i1.WidgetbookUseCase(
          name: 'DatePicker',
          builder: _i24.datepicker,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'ThemeDropdown',
        useCase: _i1.WidgetbookUseCase(
          name: 'Dropdown',
          builder: _i25.dropdown,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'ThemeSlider',
        useCase: _i1.WidgetbookUseCase(
          name: 'ThemeSlider',
          builder: _i26.sliders,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'ThemeTabBar',
        useCase: _i1.WidgetbookUseCase(
          name: 'TabBar',
          builder: _i27.tabBar,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'ThemeText',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'AutoResize text styles',
            builder: _i28.themeAutoResizeText,
          ),
          _i1.WidgetbookUseCase(
            name: 'text styles',
            builder: _i28.themeText,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'ThemeToggle',
        useCase: _i1.WidgetbookUseCase(
          name: 'Toggle',
          builder: _i29.evToggle,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'ThemeZoiCard',
        useCase: _i1.WidgetbookUseCase(
          name: 'ZoiCard',
          builder: _i30.zoiCard,
        ),
      ),
      _i1.WidgetbookFolder(
        name: 'view_annotations',
        children: [
          _i1.WidgetbookComponent(
            name: 'CTAMarker',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'EV toggle',
                builder: _i31.evToggle,
              ),
              _i1.WidgetbookUseCase(
                name: 'cta marker',
                builder: _i32.ctaMarker,
              ),
            ],
          ),
          _i1.WidgetbookLeafComponent(
            name: 'ImagePoiMarker',
            useCase: _i1.WidgetbookUseCase(
              name: 'Image Poi Markers',
              builder: _i14.customImagePoiMarkers,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'RouteMarker',
            useCase: _i1.WidgetbookUseCase(
              name: 'poi cards masonry dynamic ratio',
              builder: _i33.routeMarker,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'TextPoiMarker',
            useCase: _i1.WidgetbookUseCase(
              name: 'Text Poi Markers',
              builder: _i14.customTextPoiMarkers,
            ),
          ),
        ],
      ),
    ],
  ),
];
