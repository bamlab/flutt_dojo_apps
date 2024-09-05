import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart'; // Pour le Ticker
import 'package:flutter_bam_theme/cdapp_theme.dart';
import 'package:flutter_dojo_apps/screenlist/screen_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

Future<void> main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AnimatedShaderBackground(
        child: ScreenList(),
      ),
      title: 'Flutter Demo',
      theme: dojo,
    );
  }
}

class AnimatedShaderBackground extends StatefulWidget {
  const AnimatedShaderBackground({required this.child, super.key});
  final Widget child;

  @override
  _AnimatedShaderBackgroundState createState() =>
      _AnimatedShaderBackgroundState();
}

class _AnimatedShaderBackgroundState extends State<AnimatedShaderBackground>
    with SingleTickerProviderStateMixin {
  late Ticker _ticker;
  double _time = 0;

  @override
  void initState() {
    super.initState();
    // Initialiser un Ticker pour animer le shader
    _ticker = createTicker((elapsed) {
      setState(() {
        _time = elapsed.inMilliseconds / 1000.0; // Temps en secondes
      });
    });
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.stop();
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ShaderBuilder(
      (context, shader, child) {
        return CustomPaint(
          painter: AnimatedShaderPainter(
            shader: shader,
            time: _time,
            theme: theme,
          ),
          size: MediaQuery.sizeOf(context),
          child: widget.child,
        );
      },
      assetKey: 'assets/myshader.frag',
    );
  }
}

class AnimatedShaderPainter extends CustomPainter {
  AnimatedShaderPainter({
    required this.shader,
    required this.time,
    required this.theme,
  });
  final FragmentShader shader;
  final double time;
  final ThemeData theme;

  @override
  void paint(Canvas canvas, Size size) {
    final colorPrimary = theme.colors.primaryLight;
    final colorSecondary = theme.colors.primaryLight;
    final colorAccent1 = theme.colors.primaryLight;
    final colorAccent2 = theme.colors.secondary;

    // Passer la résolution à l'uniforme
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    // Passer le temps à l'uniforme
    shader.setFloat(2, time);
    // Passer les couleurs à l'uniforme (RGB values between 0 and 1)

    shader.setFloat(3, colorPrimary.red / 255);
    shader.setFloat(4, colorPrimary.green / 255);
    shader.setFloat(5, colorPrimary.blue / 255);

    shader.setFloat(6, colorSecondary.red / 255);
    shader.setFloat(7, colorSecondary.green / 255);
    shader.setFloat(8, colorSecondary.blue / 255);

    shader.setFloat(9, colorAccent1.red / 255);
    shader.setFloat(10, colorAccent1.green / 255);
    shader.setFloat(11, colorAccent1.blue / 255);

    shader.setFloat(12, colorAccent2.red / 255);
    shader.setFloat(13, colorAccent2.green / 255);
    shader.setFloat(14, colorAccent2.blue / 255);

    final paint = Paint()..shader = shader;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // On repaint à chaque frame pour l'animation
  }
}
