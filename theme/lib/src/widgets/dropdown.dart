import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/src/theme/extensions.dart';
import 'package:flutter_bam_theme/src/theme/themes_data.dart';
import 'package:flutter_bam_theme/src/widgets/gap.dart';
import 'package:flutter_bam_theme/src/widgets/icons.g.dart';
import 'package:flutter_bam_theme/src/widgets/modal.dart';
import 'package:flutter_bam_theme/src/widgets/radio_button.dart';
import 'package:flutter_bam_theme/src/widgets/tap.dart';
import 'package:flutter_bam_theme/src/widgets/text.dart';

class Dropdown<T> extends StatefulWidget {
  const Dropdown({
    required this.onItemSelected,
    required this.radioButtons,
    required this.selectionModalHeader,
    required this.initialItem,
    super.key,
    this.whenTapped,
  });

  final Widget selectionModalHeader;
  final List<RadioButton<T>> radioButtons;
  final void Function(T) onItemSelected;
  final T initialItem;
  final VoidCallback? whenTapped;

  @override
  State<Dropdown<T>> createState() => _DropdownState<T>();
}

class _DropdownState<T> extends State<Dropdown<T>> {
  late T _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.initialItem;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final whenTapped = widget.whenTapped;

    final selectedRadioButton = widget.radioButtons
        .firstWhereOrNull((radioButton) => radioButton.item == _selectedItem);
    final name = selectedRadioButton?.name;

    return Row(
      children: [
        AppTap(
          onTap: () async {
            if (whenTapped != null) {
              whenTapped();
            }
            await showAppModal(
              routeName: 'dropdown_modal',
              context: context,
              child: _DropdownMenu<T>(
                radioButtons: widget.radioButtons,
                selectionModalHeader: widget.selectionModalHeader,
                onTap: _onTap,
              ),
            );
          },
          borderRadius: theme.radius.asBorderRadius.xs,
          child: Padding(
            padding: theme.sizes.asInsets.m.horizontalOnly / 2,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (name != null)
                  AppText.bodyMedium(name, fontWeight: FontWeight.w600),
                const AppGap.xs(),
                const Icon(ThemeIcons.chevrondown_solid),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _onTap(T newItem) {
    setState(() {
      _selectedItem = newItem;
    });
    widget.onItemSelected(newItem);
  }
}

class _DropdownMenu<T> extends StatelessWidget {
  const _DropdownMenu({
    required this.selectionModalHeader,
    required this.radioButtons,
    required this.onTap,
  });

  final List<RadioButton<T>> radioButtons;
  final Widget selectionModalHeader;
  final void Function(T item) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        selectionModalHeader,
        for (final RadioButton<T> radioButton in radioButtons)
          AppTap(
            child: radioButton,
            onTap: () {
              onTap(radioButton.item);
            },
          ),
        const AppGap.xxl(hasAdaptiveBottom: true),
      ],
    );
  }
}
