# Aurora Background

A beautiful and highly customizable aurora background effect for Flutter applications. This package provides an animated aurora effect with a starry night sky background, perfect for creating atmospheric and engaging user interfaces.

## Features

- Customizable aurora waves with adjustable colors, speeds, and intensities
- Configurable starfield background
- Adjustable background gradient
- Smooth animations and performance optimized
- Fully customizable parameters
- Easy to implement

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  aurora_background: ^1.0.0
```

## Usage

Basic usage:

```dart
AuroraBackground(
  child: YourWidget(),
)
```

Customized usage:

```dart
AuroraBackground(
  numberOfWaves: 4,
  backgroundColors: const [
    Color(0xFF0B1026),
    Color(0xFF1B2735),
    Color(0xFF2C3E50),
  ],
  waveDurations: const [6, 12, 18, 24],
  waveColors: const [
    [Color(0x558CE8FF), Color(0x558CE8FF), Color(0x558CE8FF)],
    [Color(0x5587FF9B), Color(0x5587FF9B), Color(0x5587FF9B)],
    [Color(0x55B987FF), Color(0x55B987FF), Color(0x55B987FF)],
  ],
  waveHeightMultiplier: 0.2,
  baseHeightMultiplier: 0.35,
  waveBlur: 30,
  starFieldConfig: StarFieldConfig(
    starCount: 200,
    maxStarSize: 2.0,
    starColor: Colors.white.withOpacity(0.8),
    seed: 123,
  ),
  child: YourWidget(),
)
```

## Configuration Options

### AuroraBackground

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `child` | `Widget` | required | The widget to display on top of the aurora background |
| `numberOfWaves` | `int` | 3 | Number of aurora waves to
