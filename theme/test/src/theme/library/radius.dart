part of 'library.dart';

ThemeSection radius(BuildContext context) {
  final theme = Theme.of(context);

  return ThemeSection(
    title: 'Border radius',
    categories: [
      ThemeCategory(
        title: 'Regular',
        children: [
          ...theme.radius.namedProps.map(
            (r) {
              return ThemeCell(
                title: r.name,
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: r.value),
                    color: theme.colors.onBackground,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
