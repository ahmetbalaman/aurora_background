import 'package:flutter/material.dart';
import 'dart:math' as math;

class StarFieldConfig {
  /// Number of stars to be displayed
  final int starCount;

  /// Maximum star size
  final double maxStarSize;

  /// Star color
  final Color starColor;

  /// Random seed for consistent star positioning
  final int seed;

  const StarFieldConfig({
    this.starCount = 100,
    this.maxStarSize = 1.5,
    this.starColor = Colors.white,
    this.seed = 42,
  });
}

class StarField extends StatelessWidget {
  final StarFieldConfig config;

  const StarField({
    super.key,
    this.config = const StarFieldConfig(),
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: StarPainter(config: config),
      size: Size.infinite,
    );
  }
}

class StarPainter extends CustomPainter {
  final StarFieldConfig config;

  StarPainter({required this.config});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(config.seed);
    final paint = Paint()
      ..color = config.starColor
      ..style = PaintingStyle.fill;

    for (var i = 0; i < config.starCount; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * config.maxStarSize;

      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(StarPainter oldDelegate) => oldDelegate.config != config;
}
