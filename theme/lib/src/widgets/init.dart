import 'package:flutter/material.dart';

class Init extends StatefulWidget {
  const Init({
    required this.init,
    required this.child,
    super.key,
  });

  final void Function() init;
  final Widget child;

  @override
  State<Init> createState() => _InitState();
}

class _InitState extends State<Init> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
