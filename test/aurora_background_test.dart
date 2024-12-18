import 'package:aurora_background/aurora_painter.dart';
import 'package:aurora_background/star_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aurora_background/aurora_background.dart';

void main() {
  group('AuroraBackground Widget Tests', () {
    testWidgets('renders with default parameters', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AuroraBackground(
            child: SizedBox(),
          ),
        ),
      );

      expect(find.byType(AuroraBackground), findsOneWidget);
      expect(find.byType(StarField), findsOneWidget);
    });

    testWidgets('renders with custom parameters', (WidgetTester tester) async {
      const customStarConfig = StarFieldConfig(
        starCount: 200,
        maxStarSize: 2.0,
        starColor: Colors.white,
        seed: 123,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: AuroraBackground(
            numberOfWaves: 4,
            backgroundColors: const [
              Color(0xFF0B1026),
              Color(0xFF1B2735),
              Color(0xFF2C3E50),
              Color(0xFF3D4F60),
            ],
            waveDurations: const [6, 12, 18, 24],
            waveColors: const [
              [Color(0x558CE8FF), Color(0x558CE8FF), Color(0x558CE8FF)],
              [Color(0x5587FF9B), Color(0x5587FF9B), Color(0x5587FF9B)],
              [Color(0x55B987FF), Color(0x55B987FF), Color(0x55B987FF)],
              [Color(0x55FF87B9), Color(0x55FF87B9), Color(0x55FF87B9)],
            ],
            waveHeightMultiplier: 0.2,
            baseHeightMultiplier: 0.35,
            waveBlur: 30,
            starFieldConfig: customStarConfig,
            child: SizedBox(),
          ),
        ),
      );

      expect(find.byType(AuroraBackground), findsOneWidget);
      expect(find.byType(StarField), findsOneWidget);
      // Test that we have 4 CustomPaint widgets for the waves
      expect(
          find.byWidgetPredicate((widget) =>
              widget is CustomPaint && widget.painter is AuroraPainter),
          findsNWidgets(4));
    });

    testWidgets('child widget is rendered', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AuroraBackground(
            child: Text('Test Child'),
          ),
        ),
      );

      expect(find.text('Test Child'), findsOneWidget);
    });

    testWidgets('aurora waves are rendered correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AuroraBackground(
            child: SizedBox(),
          ),
        ),
      );

      // Verify the base structure
      expect(find.byType(Stack), findsOneWidget);
      expect(find.byType(Container), findsOneWidget); // Background gradient
      expect(find.byType(StarField), findsOneWidget);

      // Verify aurora waves
      expect(
          find.byWidgetPredicate((widget) =>
              widget is CustomPaint && widget.painter is AuroraPainter),
          findsNWidgets(3) // Default number of waves
          );

      // Let the animation run for a bit
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump(const Duration(milliseconds: 100));

      // Verify that the widget is still rendered correctly after animation
      expect(
          find.byWidgetPredicate((widget) =>
              widget is CustomPaint && widget.painter is AuroraPainter),
          findsNWidgets(3));
    });
  });
}
