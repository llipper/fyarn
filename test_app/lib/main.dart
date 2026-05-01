import 'package:flutter/material.dart';
import 'package:test_app/components/core/theme/fyarn_theme_engine.dart';
import 'package:test_app/components/core/theme/fyarn_theme.dart';
import 'package:test_app/components/core/theme/presets/default_colors.dart';
import 'package:test_app/components/core/theme/presets/amber_colors.dart';
import 'package:test_app/components/core/theme/presets/emerald_colors.dart';
import 'package:test_app/components/core/theme/presets/rose_colors.dart';
import 'package:test_app/components/core/theme/presets/ruby_colors.dart';
import 'package:test_app/components/core/theme/theme_controller.dart';

// Pages
import 'pages/home_page.dart';
import 'pages/accordion_page.dart';
import 'pages/text_page.dart';
import 'pages/trail_page.dart';
import 'pages/trip_page.dart';
import 'pages/card_page.dart';
import 'pages/auth_showcase_page.dart';
import 'pages/alert_page.dart';
import 'pages/alert_dialog_page.dart';
import 'pages/badge_page.dart';
import 'pages/breadcrumb_page.dart';
import 'pages/button_group_page.dart';
import 'pages/calendar_page.dart';
import 'pages/carousel_page.dart';

void main() {
  // Register the standard Fyarn themes
  FyarnThemeEngine.register('default', FyarnColorsDefault());
  FyarnThemeEngine.register('default_dark', FyarnColorsDefaultDark());

  FyarnThemeEngine.register('amber', FyarnColorsAmber());
  FyarnThemeEngine.register('amber_dark', FyarnColorsAmberDark());

  FyarnThemeEngine.register('emerald', FyarnColorsEmerald());
  FyarnThemeEngine.register('emerald_dark', FyarnColorsEmeraldDark());

  FyarnThemeEngine.register('rose', FyarnColorsRose());
  FyarnThemeEngine.register('rose_dark', FyarnColorsRoseDark());

  FyarnThemeEngine.register('ruby', FyarnColorsRuby());
  FyarnThemeEngine.register('ruby_dark', FyarnColorsRubyDark());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ThemeController.instance,
      builder: (context, _) {
        final controller = ThemeController.instance;
        return FyarnTheme(
          themeName: controller.themeName,
          brightness: controller.brightness,
          child: MaterialApp(
            title: 'Fyarn UI — Showcase',
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/': (context) => const HomePage(),
              '/accordion': (context) => const AccordionPage(),
              '/text': (context) => const TextPage(),
              '/trail': (context) => const TrailPage(),
              '/trip': (context) => const TripPage(),
              '/memory': (context) => const CardPage(),
              '/auth': (context) => const AuthShowcasePage(),
              '/alerts': (context) => const AlertPage(),
              '/dialogs': (context) => const AlertDialogPage(),
              '/badges': (context) => const BadgePage(),
              '/breadcrumb': (context) => const BreadcrumbPage(),
              '/button_group': (context) => const ButtonGroupPage(),
              '/calendar': (context) => const CalendarPage(),
              '/carousel': (context) => const CarouselPage(),
            },
          ),
        );
      },
    );
  }
}
