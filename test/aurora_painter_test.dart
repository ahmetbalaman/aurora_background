import 'package:aurora_background/aurora_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuroraPainter Tests', () {
    test('shouldRepaint returns true for different animation values', () {
      final painter1 = AuroraPainter(
        animation: 0.0,
        waveIndex: 0,
        colors: const [Colors.blue, Colors.blue, Colors.blue],
        waveHeightMultiplier: 0.15,
        baseHeightMultiplier: 0.4,
        blur: 40,
      );

      final painter2 = AuroraPainter(
        animation: 0.5,
        waveIndex: 0,
        colors: const [Colors.blue, Colors.blue, Colors.blue],
        waveHeightMultiplier: 0.15,
        baseHeightMultiplier: 0.4,
        blur: 40,
      );

      expect(painter1.shouldRepaint(painter2), true);
    });

    test('shouldRepaint returns false for same animation values', () {
      final painter1 = AuroraPainter(
        animation: 0.5,
        waveIndex: 0,
        colors: const [Colors.blue, Colors.blue, Colors.blue],
        waveHeightMultiplier: 0.15,
        baseHeightMultiplier: 0.4,
        blur: 40,
      );

      final painter2 = AuroraPainter(
        animation: 0.5,
        waveIndex: 0,
        colors: const [Colors.blue, Colors.blue, Colors.blue],
        waveHeightMultiplier: 0.15,
        baseHeightMultiplier: 0.4,
        blur: 40,
      );

      expect(painter1.shouldRepaint(painter2), false);
    });
  });
}
