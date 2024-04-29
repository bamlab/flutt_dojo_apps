# cdapp_theme

Things to update for a new project:

1. Icons:
    - Download the icon font from [here](https://www.fluttericon.com/) with the name of your app + Icons in **PascalCase** (e.g. `FlutterBamIcons`)
    - Update the icon fonts `FlutterBamIcons.ttf` in the `fonts/icons` folder
    - Copy the `cdapp_icons_icons.dart` content in the `cdapp_theme/lib/src/theme/data/icons.g.dart` file

2. Colors:
    - Update the `cdapp_theme/lib/src/theme/data/colors.dart` file by adding the new colors in the factories and the props

3. Sizes:
    - Update the `cdapp_theme/lib/src/theme/data/sizes.dart` file

4. Fonts:
    - Copy your fonts in the `fonts` folder
    - Add the fonts to `pubspec.yaml`

5. Text Styles:
    - Update the `cdapp_theme/lib/src/theme/data/typography.dart` & `cdapp_theme/lib/src/widgets/text.dart` files with your text styles