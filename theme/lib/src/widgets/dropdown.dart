import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';

class Dropdown<T> extends StatefulWidget {
  const Dropdown({
    super.key,
    required this.onItemSelected,
    required this.radioButtons,
    required this.selectionModalHeader,
    required this.initialItem,
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
  late T selectedItem;

  @override
  void initState() {
    selectedItem = widget.initialItem;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final whenTapped = widget.whenTapped;

    final selectedRadioButton = widget.radioButtons
        .firstWhere((radioButton) => radioButton.item == selectedItem);
    final name = selectedRadioButton.name;
    return Row(
      children: [
        AppTap(
          onTap: () {
            if (whenTapped != null) {
              whenTapped();
            }
            showAppModal(
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
                  AppText.bodyMedium(
                    name,
                    fontWeight: FontWeight.w600,
                  ),
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
      selectedItem = newItem;
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
        const AppGap.xxl(
          hasAdaptiveBottom: true,
        ),
      ],
    );
  }
}
