import 'package:aurora_background/star_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StarField Widget Tests', () {
    testWidgets('renders with default config', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StarField(),
          ),
        ),
      );

      expect(find.byType(StarField), findsOneWidget);
      // Test for CustomPaint widget specifically from StarField
      expect(
          find.byWidgetPredicate((widget) =>
              widget is CustomPaint && widget.painter is StarPainter),
          findsOneWidget);
    });

    testWidgets('renders with custom config', (WidgetTester tester) async {
      const customConfig = StarFieldConfig(
        starCount: 200,
        maxStarSize: 2.0,
        starColor: Colors.blue,
        seed: 123,
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StarField(
              config: customConfig,
            ),
          ),
        ),
      );

      expect(find.byType(StarField), findsOneWidget);
      expect(
          find.byWidgetPredicate((widget) =>
              widget is CustomPaint && widget.painter is StarPainter),
          findsOneWidget);

      // Verify custom config is applied
      final customPaint = tester.widget<CustomPaint>(
        find.byWidgetPredicate(
            (widget) => widget is CustomPaint && widget.painter is StarPainter),
      );
      final starPainter = customPaint.painter as StarPainter;
      expect(starPainter.config.starCount, equals(200));
      expect(starPainter.config.starColor, equals(Colors.blue));
    });
  });
}
