# Aurora Background

[![pub package](https://img.shields.io/pub/v/aurora_background.svg)](https://pub.dev/packages/aurora_background)
[![likes](https://img.shields.io/pub/likes/aurora_background?label=likes)](https://pub.dev/packages/aurora_background/score)
[![popularity](https://img.shields.io/pub/popularity/aurora_background?label=popularity)](https://pub.dev/packages/aurora_background/score)
[![style: flutter](https://img.shields.io/badge/style-flutter-blue)](https://flutter.dev)

A beautiful and highly customizable aurora background effect for Flutter applications. Create stunning animated backgrounds with aurora waves and a starry night sky.

## 🌟 Features

- Smooth animated aurora waves
- Customizable colors and animations
- Interactive starfield background
- High performance and low memory footprint
- Highly customizable parameters
- Easy to implement

## 📱 Preview

### Default Aurora Effect
[Buraya varsayılan aurora efektinin GIF'ini ekleyin - ideal boyut: 300x600]

### Customized Aurora
[Buraya özelleştirilmiş aurora efektinin GIF'ini ekleyin - ideal boyut: 300x600]

### Interactive Demo
[Buraya interaktif bir demo GIF'i ekleyin - ideal boyut: 300x600]

## 🚀 Getting Started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  aurora_background: ^1.0.0
```

## 💻 Usage

### Basic Usage

```dart
AuroraBackground(
  child: YourWidget(),
)
```

### Advanced Usage

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

## ⚙️ Configuration Options

### AuroraBackground Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `child` | `Widget` | required | The widget to display on top of the aurora background |
| `numberOfWaves` | `int` | 3 | Number of aurora waves |
| `backgroundColors` | `List<Color>` | [see code] | Background gradient colors |
| `waveDurations` | `List<int>` | [8, 16, 24] | Animation duration for each wave |
| `waveColors` | `List<List<Color>>` | [see code] | Colors for each wave |
| `waveHeightMultiplier` | `double` | 0.15 | Controls wave height |
| `baseHeightMultiplier` | `double` | 0.4 | Controls base wave position |
| `waveBlur` | `double` | 40.0 | Blur intensity of waves |

### StarFieldConfig Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `starCount` | `int` | 100 | Number of stars |
| `maxStarSize` | `double` | 1.5 | Maximum star size |
| `starColor` | `Color` | Colors.white | Color of stars |
| `seed` | `int` | 42 | Random seed for star positions |

## 🎨 Examples

### Calm Aurora
[Buraya sakin aurora efektinin GIF'ini ekleyin - ideal boyut: 300x600]

```dart
AuroraBackground(
  numberOfWaves: 3,
  waveHeightMultiplier: 0.1,
  waveBlur: 50,
  child: YourWidget(),
)
```

### Dynamic Aurora
[Buraya dinamik aurora efektinin GIF'ini ekleyin - ideal boyut: 300x600]

```dart
AuroraBackground(
  numberOfWaves: 5,
  waveHeightMultiplier: 0.25,
  waveDurations: const [4, 8, 12, 16, 20],
  child: YourWidget(),
)
```

### Custom Colors
[Buraya özel renkli aurora efektinin GIF'ini ekleyin - ideal boyut: 300x600]

```dart
AuroraBackground(
  backgroundColors: const [Colors.black, Colors.deepPurple],
  waveColors: const [
    [Colors.pink, Colors.pinkAccent, Colors.pink],
    [Colors.purple, Colors.purpleAccent, Colors.purple],
    [Colors.blue, Colors.blueAccent, Colors.blue],
  ],
  child: YourWidget(),
)
```

## 🤝 Contributing

Contributions are welcome! If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".

Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

Distributed under the MIT License. See `LICENSE` for more information.

## 📧 Contact

Your Name - [@yourtwitter](https://twitter.com/yourtwitter) - email@example.com

Project Link: [https://github.com/yourusername/aurora_background](https://github.com/yourusername/aurora_background)

## 🙏 Acknowledgments

* [Flutter](https://flutter.dev)
* [Dart](https://dart.dev)
* [Choose an Open Source License](https://choosealicense.com)
