import 'package:flutter/material.dart';
import 'dart:math' as math;

class AuroraPainter extends CustomPainter {
  final double animation;
  final int waveIndex;
  final List<Color> colors;
  final double waveHeightMultiplier;
  final double baseHeightMultiplier;
  final double blur;

  AuroraPainter({
    required this.animation,
    required this.waveIndex,
    required this.colors,
    required this.waveHeightMultiplier,
    required this.baseHeightMultiplier,
    required this.blur,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          colors[0].withOpacity(0.1),
          colors[1].withOpacity(0.5),
          colors[2].withOpacity(0.1),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blur);

    final path = Path();
    final baseHeight = size.height * (baseHeightMultiplier + waveIndex * 0.15);
    const segments = 6;
    final points = <Offset>[];

    points.add(Offset(0, size.height));
    points.add(Offset(0, baseHeight + size.height * 0.1));

    for (var i = 0; i <= segments; i++) {
      final progress = i / segments;
      final x = size.width * progress;

      final phase = animation * 4 * math.pi;
      final frequency = 3 + waveIndex;

      final wave1 = math.sin(progress * math.pi * frequency + phase) * 0.5;
      final wave2 =
          math.sin(progress * math.pi * (frequency + 1) + phase * 1.5) * 0.3;
      final wave3 =
          math.sin(progress * math.pi * (frequency + 2) + phase * 0.5) * 0.2;

      final combinedWave = (wave1 + wave2 + wave3);
      final heightVariation = size.height * waveHeightMultiplier * combinedWave;
      final y = baseHeight + heightVariation;

      points.add(Offset(x, y));
    }

    points.add(Offset(size.width, baseHeight));
    points.add(Offset(size.width, size.height));

    _drawSmoothPath(path, points, canvas, paint, size);
  }

  void _drawSmoothPath(
      Path path, List<Offset> points, Canvas canvas, Paint paint, Size size) {
    path.moveTo(points.first.dx, points.first.dy);

    for (var i = 0; i < points.length - 2; i++) {
      final p0 = points[i];
      final p1 = points[i + 1];
      final p2 = points[i + 2];

      final controlPoint1 = Offset(
        p0.dx + (p1.dx - p0.dx) * 0.5,
        p0.dy + (p1.dy - p0.dy) * 0.5,
      );
      final controlPoint2 = Offset(
        p1.dx + (p2.dx - p1.dx) * 0.5,
        p1.dy + (p2.dy - p1.dy) * 0.5,
      );

      path.cubicTo(
        controlPoint1.dx,
        controlPoint1.dy,
        controlPoint2.dx,
        controlPoint2.dy,
        p1.dx,
        p1.dy,
      );
    }

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(AuroraPainter oldDelegate) {
    return oldDelegate.animation != animation;
  }
}
