library aurora_background;

// lib/src/aurora_background.dart
import 'package:flutter/material.dart';
import 'star_field.dart';
import 'aurora_painter.dart';

class AuroraBackground extends StatefulWidget {
  /// The child widget to be displayed on top of the aurora background
  final Widget child;

  /// Number of aurora waves to be displayed
  final int numberOfWaves;

  /// Background gradient colors from top to bottom
  final List<Color> backgroundColors;

  /// Animation duration in seconds for each wave
  final List<int> waveDurations;

  /// Wave colors for each layer
  final List<List<Color>> waveColors;

  /// Wave height multiplier (default is 0.15)
  final double waveHeightMultiplier;

  /// Wave base height multiplier (default is 0.4)
  final double baseHeightMultiplier;

  /// Wave blur intensity
  final double waveBlur;

  /// Star field configuration
  final StarFieldConfig starFieldConfig;

  const AuroraBackground({
    super.key,
    required this.child,
    this.numberOfWaves = 3,
    this.backgroundColors = const [
      Color(0xFF0B1026),
      Color(0xFF1B2735),
      Color(0xFF2C3E50),
    ],
    this.waveDurations = const [8, 16, 24],
    this.waveColors = const [
      [Color(0x558CE8FF), Color(0x558CE8FF), Color(0x558CE8FF)],
      [Color(0x5587FF9B), Color(0x5587FF9B), Color(0x5587FF9B)],
      [Color(0x55B987FF), Color(0x55B987FF), Color(0x55B987FF)],
    ],
    this.waveHeightMultiplier = 0.15,
    this.baseHeightMultiplier = 0.4,
    this.waveBlur = 40,
    this.starFieldConfig = const StarFieldConfig(),
  }) : assert(
          backgroundColors.length >= 2,
          'backgroundColors must contain at least 2 colors',
        );

  @override
  State<AuroraBackground> createState() => _AuroraBackgroundState();
}

class _AuroraBackgroundState extends State<AuroraBackground>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _controllers = List.generate(
      widget.numberOfWaves,
      (index) => AnimationController(
        duration: Duration(seconds: widget.waveDurations[index]),
        vsync: this,
      )..repeat(),
    );

    _animations = _controllers.map((controller) {
      return CurvedAnimation(
        parent: controller,
        curve: Curves.linear,
      );
    }).toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: widget.backgroundColors,
              stops: _generateGradientStops(widget.backgroundColors.length),
            ),
          ),
        ),
        StarField(config: widget.starFieldConfig),
        ...List.generate(widget.numberOfWaves, (index) {
          return AnimatedBuilder(
            animation: _animations[index],
            builder: (context, child) {
              return CustomPaint(
                painter: AuroraPainter(
                  animation: _animations[index].value,
                  waveIndex: index,
                  colors: widget.waveColors[index],
                  waveHeightMultiplier: widget.waveHeightMultiplier,
                  baseHeightMultiplier: widget.baseHeightMultiplier,
                  blur: widget.waveBlur,
                ),
                size: Size.infinite,
              );
            },
          );
        }),
        widget.child,
      ],
    );
  }

  List<double> _generateGradientStops(int length) {
    return List.generate(
      length,
      (index) => index / (length - 1),
    );
  }
}
