# 🧶 Fyarn CLI & UI Design System

[![pub package](https://img.shields.io/pub/v/fyarn.svg)](https://pub.dev/packages/fyarn)
[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=flutter&logoColor=white)](https://flutter.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**Fyarn** is a high-performance, context-aware CLI and Design System for Flutter. Strongly inspired by the philosophy of modern web tools (like shadcn/ui), Fyarn allows you to generate beautifully designed, accessible, and highly customizable UI components directly into your Flutter source code.

> **It's not a package you install. It's code you own.**

---

## ⚡ Why Fyarn?

Most UI libraries in Flutter lock you into rigid `ThemeData` implementations or force you to install heavy external packages. Fyarn takes a different approach:

-   **Code Ownership**: The CLI generates raw `.dart` files into your project. Modify every pixel, animation, and behavior.
-   **Zero Global State**: Powered by an atomic `InheritedWidget` architecture.
-   **100% Theme Reactive**: Through the `context.fy` extension, components react to Dark/Light modes instantly.
-   **Atomic Design**: Built on top of tokens (Spacing, Typography, Shapes, Colors) for total consistency.

---

## 🚀 Quick Start

### 1. Install the CLI
Activate Fyarn globally on your machine:

```bash
dart pub global activate fyarn
```

### 2. Initialize your Project
Navigate to your Flutter project and run:

```bash
fyarn init
```
This generates the foundational **Design System Engine** inside `lib/components/core/`.

### 3. Setup the Engine
Initialize the themes in your `main()` and wrap your app:

```dart
import 'package:your_app/components/core/theme/fyarn_theme.dart';
import 'package:your_app/components/core/theme/fyarn_theme_engine.dart';
import 'package:your_app/components/core/theme/presets/default_colors.dart';

void main() {
  // Register your themes
  FyarnThemeEngine.register('default', FyarnColorsDefault());
  FyarnThemeEngine.register('default_dark', FyarnColorsDefaultDark());

  runApp(
    const FyApp(),
  );
}

class FyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FyarnTheme(
      themeName: 'default', // Your registered theme name
      child: MaterialApp(
        home: const HomePage(),
      ),
    );
  }
}
```

---

## 📦 Adding Components

Need a component? Use the `add` command. Fyarn will generate the component and its dependencies.

```bash
# Add a single component
fyarn add button

# Add multiple components
fyarn add card text badge dialog
```

### Usage
Access the engine tokens using the semantic `context.fy` extension:

```dart
Widget build(BuildContext context) {
  final fy = context.fy;
  
  return Container(
    padding: EdgeInsets.all(fy.spacing.md),
    color: fy.colors.background,
    child: FyarnButton(
      text: 'Fyarn Rocks!',
      variant: FyarnButtonVariant.primary,
      onPressed: () {},
    ),
  );
}
```

---

## 🧩 Component Registry

Fyarn includes 50+ premium components ready to use:

-   **Foundation**: `text`, `card`, `separator`, `aspect_ratio`, `skeleton`.
-   **Buttons**: `button`, `badge`, `spinner`, `progress`.
-   **Forms**: `field`, `textarea`, `checkbox`, `switch`, `radio_group`, `slider`, `input_otp`.
-   **Overlays**: `dialog`, `sonner`, `tooltip`, `sheet`, `alert_dialog`, `hover_card`.
-   **Navigation**: `tabs`, `dropdown_menu`, `sidebar`, `breadcrumb`, `pagination`.
-   **Specialized**: `calendar`, `data_table`, `chart`, `avatar`.

---

## 🎨 The `context.fy` Philosophy

Stop wrestling with Flutter's massive global `Theme.of(context)`. Fyarn provides localized, semantic tokens:

| Old Flutter Way | ✅ The Fyarn Way |
| :--- | :--- |
| `Theme.of(context).colorScheme.primary` | `context.fy.colors.primary` |
| `const EdgeInsets.all(16.0)` | `EdgeInsets.all(context.fy.spacing.md)` |
| `Theme.of(context).textTheme.headlineMedium` | `context.fy.typography.h2` |

---

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

*Made with passion by the Fyarn Team.*
