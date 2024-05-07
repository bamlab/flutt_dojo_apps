import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';

typedef CustomNavigationBarButton = ({IconData icon, String label});

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
    required this.navigationTabs,
    required this.currentIndex,
    required this.onTap,
  }) : assert(currentIndex >= 0 && currentIndex < navigationTabs.length);

  final List<CustomNavigationBarButton> navigationTabs;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomPadding = MediaQuery.paddingOf(context).bottom;

    return Container(
      decoration: BoxDecoration(
          color: theme.colors.surface.withOpacity(0.4),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          gradient: LinearGradient(
              colors: [
                theme.colors.surface.withOpacity(0.4),
                theme.colors.surface.withOpacity(0.8),
              ],
              begin: Alignment.center,
              end: Alignment.centerRight,
              tileMode: TileMode.mirror)),
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding, top: theme.sizes.m) +
            theme.sizes.asInsets.m.horizontalOnly,
        child: DividedRow(
          mainAxisAlignment: MainAxisAlignment.center,
          customSeparator: const AppGap.xl(),
          children: navigationTabs
              .mapIndexedAndLast<Widget>((index, e, _) => CustomNavigationItems(
                    customNavigationBarButton: e,
                    isSelected: index == currentIndex,
                    onTap: () => onTap(index),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class CustomNavigationItems extends StatelessWidget {
  const CustomNavigationItems({
    super.key,
    required this.isSelected,
    required this.customNavigationBarButton,
    required this.onTap,
  });

  final bool isSelected;
  final CustomNavigationBarButton customNavigationBarButton;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          padding: EdgeInsets.symmetric(
              horizontal: theme.sizes.m, vertical: theme.sizes.xs),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: isSelected ? theme.colors.primary : Colors.transparent),
          child: Row(
            children: [
              Icon(
                customNavigationBarButton.icon,
                size: 24,
                color:
                    isSelected ? theme.colors.surface : theme.colors.onSurface,
              ),
              if (isSelected) ...[
                const AppGap.xs(),
                AppText.bodyMedium(customNavigationBarButton.label)
              ]
            ],
          )),
    );
  }
}
