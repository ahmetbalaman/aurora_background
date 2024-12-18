import 'package:aurora_background/star_field.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StarPainter Tests', () {
    test('shouldRepaint returns true for different configs', () {
      const config1 = StarFieldConfig(starCount: 100);
      const config2 = StarFieldConfig(starCount: 200);

      final painter1 = StarPainter(config: config1);
      final painter2 = StarPainter(config: config2);

      expect(painter1.shouldRepaint(painter2), true);
    });

    test('shouldRepaint returns false for same config', () {
      const config = StarFieldConfig(starCount: 100);

      final painter1 = StarPainter(config: config);
      final painter2 = StarPainter(config: config);

      expect(painter1.shouldRepaint(painter2), false);
    });
  });
}
