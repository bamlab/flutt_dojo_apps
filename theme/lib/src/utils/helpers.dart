import 'package:flutter/cupertino.dart';

bool shouldShowBackButton(
  BuildContext context, {
  bool? automaticallyImplyLeading,
}) {
  final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
  final canPop = parentRoute?.canPop ?? false;
  return (canPop || (parentRoute?.impliesAppBarDismissal ?? false)) &&
      (automaticallyImplyLeading ?? true);
}
