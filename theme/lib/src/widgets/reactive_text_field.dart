import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: avoid-importing-entrypoint-exports , (louisg) I don't understand how to fix this
import 'package:flutter_bam_theme/const/regex.dart';
import 'package:flutter_bam_theme/src/theme/themes_data.dart';
import 'package:flutter_bam_theme/src/widgets/gap.dart';
import 'package:flutter_bam_theme/src/widgets/text.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AppReactiveTextField<T> extends StatefulWidget {
  const AppReactiveTextField({
    required this.label,
    required this.formControl,
    this.icon,
    this.hint,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    this.hasError = false,
    this.errorMessage,
    this.alwaysShowErrorMessage = false,
    this.keyboardType,
    this.inputFormatters,
    this.restrictEmojis = true,
    this.autofillHints,
    this.obscureText = false,
    this.isSliver = false,
    this.enabled = true,
    this.textInputAction,
    super.key,
  });

  /// The label of the text field.
  /// Shown at the top of the text field.
  final String label;

  /// The icon shown at the end of the field.
  ///
  /// If null, no icon is showed.
  final Widget? icon;

  /// The eventual hint shown in the text field.
  ///
  /// If null, no hint is showed.
  final String? hint;

  /// The controller of the text field.
  ///
  /// If null, the text field will have a default controller.
  final TextEditingController? controller;

  /// The focus node of the text field.
  ///
  /// If null, the text field will have a default focus node.
  final FocusNode? focusNode;

  final void Function(T?)? onChanged;

  final VoidCallback? onSubmitted;

  /// The reactive form control of the text field.
  final FormControl<T> formControl;

  /// Wether the field content is valid or not.
  ///
  /// Defaults to false.
  final bool hasError;

  /// The error message shown when the field is invalid.
  /// This message will be shown only if the field is invalid
  /// or if [alwaysShowErrorMessage] is true.
  final String? errorMessage;

  /// If true, the error message will be shown even if the field is valid,
  /// but with the default field color.
  ///
  /// Defaults to false.
  final bool alwaysShowErrorMessage;

  /// The type of keyboard to use for editing the text.
  final TextInputType? keyboardType;

  /// The formatters to use for this text field.
  ///
  /// For example, [FilteringTextInputFormatter.digitsOnly].
  final List<TextInputFormatter>? inputFormatters;

  /// Whether the text field should restrict emojis.
  ///
  /// Defaults to true.
  final bool restrictEmojis;

  /// The type of hints to show in the user's keyboard.
  ///
  /// For example [AutofillHints.email].
  final List<String>? autofillHints;

  /// Whether the text field should obscure the text.
  ///
  /// For example, for a password field.
  /// Defaults to false.
  final bool obscureText;

  /// Whether the text field is a sliver and should be wrapped
  /// in a [SliverToBoxAdapter].
  ///
  /// Defaults to false.
  final bool isSliver;

  /// Whether the TextField is enabled or not.
  ///
  /// Defaults to true.
  final bool enabled;

  /// The type of the actionButton on textInput keyboard.
  ///
  /// For example, [TextInputAction.next].
  final TextInputAction? textInputAction;

  @override
  State<AppReactiveTextField<T>> createState() =>
      _AppReactiveTextFieldState<T>();
}

// ignore: prefer-sliver-prefix , not necessarely a sliver
class _AppReactiveTextFieldState<T> extends State<AppReactiveTextField<T>> {
  void _toggleTextField() {
    if (widget.enabled) {
      widget.formControl.markAsEnabled();
    } else {
      widget.formControl.markAsDisabled();
    }
  }

  @override
  void initState() {
    super.initState();
    _toggleTextField();
  }

  @override
  void didUpdateWidget(covariant AppReactiveTextField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.enabled != widget.enabled) {
      _toggleTextField();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderTheme = theme.inputDecorationTheme.border;

    final errorMessage = widget.errorMessage;
    final hasCustomError = errorMessage != null;

    final field = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.bodyLarge(widget.label, color: theme.colors.primaryLight),
        const AppGap.xxs(),
        ReactiveTextField<T>(
          textInputAction: widget.textInputAction,
          style:
              theme.textTheme.bodyLarge?.copyWith(color: theme.colors.grey300),
          controller: widget.controller,
          onChanged: (control) => widget.onChanged?.call(control.value),
          onSubmitted: (_) => widget.onSubmitted?.call(),
          focusNode: widget.focusNode,
          formControl: widget.formControl,
          showErrors: (_) => !hasCustomError && widget.hasError,
          decoration: InputDecoration(
            suffixIcon: widget.icon,
            hintText: widget.hint,
            hintStyle: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colors.grey200,
            ),
            enabledBorder: hasCustomError && widget.hasError
                ? borderTheme?.copyWith(
                    borderSide: borderTheme.borderSide
                        .copyWith(color: theme.colors.onError),
                  )
                : null,
          ),
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          autofillHints: widget.autofillHints,
          inputFormatters: [
            ...?widget.inputFormatters,
            if (widget.restrictEmojis)
              FilteringTextInputFormatter.deny(kEmojiRegex),
          ],
        ),
        if (hasCustomError &&
            errorMessage.isNotEmpty &&
            (widget.hasError || widget.alwaysShowErrorMessage)) ...[
          const AppGap.xxs(),
          AppText.bodyMedium(
            errorMessage,
            color:
                widget.hasError ? theme.colors.onError : theme.colors.grey300,
          ),
        ],
      ],
    );

    return widget.isSliver ? SliverToBoxAdapter(child: field) : field;
  }
}
