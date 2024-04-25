part of 'library.dart';

ThemeSection typography(BuildContext context) {
  final theme = Theme.of(context);
  return ThemeSection(
    title: 'Typography',
    categories: [
      ThemeCategory(
        title: 'Regular',
        children: [
          ...theme.textTheme.namedProps.map(
            (t) {
              return ThemeCell(
                title: t.name,
                child: Text(
                  'Hello!',
                  style: t.value.copyWith(color: theme.colors.text),
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
