part of 'library.dart';

ThemeSection spacing(BuildContext context) {
  final theme = Theme.of(context);
  return ThemeSection(
    title: 'Spacing',
    categories: [
      ThemeCategory(
        title: 'Regular',
        children: [
          ...theme.sizes.namedProps.map(
            (s) {
              return ThemeCell(
                title: s.name,
                child: Container(
                  height: 24,
                  width: s.value,
                  color: theme.colors.onBackground,
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
