import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Toggle', type: _Toggle)
Widget evToggle(BuildContext context) {
  final theme = Theme.of(context);

  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(title: const Text('Toggle')),
    body: Padding(
      padding: theme.sizes.asInsets.m,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Toggle(
            label: 'Uniquement la séléction Michelin',
          ),
          AppGap.s(),
          _Toggle(
            label: 'Uniquement la séléction Michelin',
            value: false,
          ),
          AppGap.m(),
          Text(
            'Disabled - On',
          ),
          AppGap.s(),
          _Toggle(
            label: 'Uniquement la séléction Michelin',
            disabled: true,
          ),
          AppGap.m(),
          Text(
            'Disabled - Off',
          ),
          AppGap.s(),
          _Toggle(
            label: 'Uniquement la séléction Michelin',
            value: false,
            disabled: true,
          ),
        ],
      ),
    ),
  );
}

class _Toggle extends StatefulWidget {
  const _Toggle({
    required this.label,
    this.value = true,
    this.disabled = false,
  });

  final String label;
  final bool value;
  final bool disabled;

  @override
  State<_Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<_Toggle> {
  late bool _value = widget.value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(
          value: _value,
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          },
        ),
        const AppGap.s(),
        Text(
          widget.label,
        ),
      ],
    );
  }
}
