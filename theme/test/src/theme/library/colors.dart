part of 'library.dart';

ThemeSection colors(BuildContext context) {
  final theme = Theme.of(context);
  return ThemeSection(
    title: 'Colors',
    categories: [
      ThemeCategory(
        title: 'Regular',
        children: [
          ...theme.colors.namedProps.whereType<Named<Color>>().map(
            (c) {
              return ThemeCell(
                title: c.name,
                child: Container(
                  width: 32,
                  height: 32,
                  padding: const EdgeInsets.all(4),
                  color: c.value,
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
