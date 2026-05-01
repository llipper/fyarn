import 'package:flutter/material.dart';
import 'fyarn_colors.dart';

/// The central brain of the Fyarn Design System.
///
/// Responsible for registering and resolving theme presets dynamically,
/// with support for light/dark variants.
class FyarnThemeEngine {
  static final Map<String, FyarnColors> _presets = {};

  /// Resolves a theme preset by name with optional brightness.
  ///
  /// Priority order:
  /// 1. Specific variant (e.g., "ruby_dark")
  /// 2. Base theme (e.g., "ruby")
  /// 3. First registered theme (fallback)
  static FyarnColors resolve(
    String themeName, {
    Brightness brightness = Brightness.light,
  }) {
    final name = themeName.toLowerCase().trim();
    final suffix = brightness == Brightness.dark ? '_dark' : '';
    final specificKey = '$name$suffix';

    // Try specific variant first (ruby_dark), then base (ruby)
    return _presets[specificKey] ??
        _presets[name] ??
        _presets.values.firstOrNull ??
        (throw Exception(
          'No themes registered in FyarnThemeEngine.\n'
          'Make sure to register at least one theme using '
          'FyarnThemeEngine.register() before calling resolve().',
        ));
  }

  /// Returns a list of all registered theme preset keys.
  static List<String> get availablePresets => _presets.keys.toList()..sort();

  /// Registers a new theme preset.
  ///
  /// If a theme with the same name already exists, it will be overwritten.
  static void register(String name, FyarnColors theme) {
    if (name.trim().isEmpty) {
      throw ArgumentError('Theme name cannot be empty');
    }
    _presets[name.toLowerCase().trim()] = theme;
  }

  /// Registers both light and dark variants of a theme at once (recommended).
  static void registerWithDark({
    required String name,
    required FyarnColors light,
    required FyarnColors dark,
  }) {
    register(name, light);
    register('${name}_dark', dark);
  }

  /// Clears all registered themes (mainly useful for testing).
  static void clear() {
    _presets.clear();
  }

  /// Checks if a theme is registered.
  static bool isRegistered(String name, {Brightness? brightness}) {
    final key = name.toLowerCase().trim();
    if (brightness == null) {
      return _presets.containsKey(key);
    }
    final variantKey = brightness == Brightness.dark ? '${key}_dark' : key;
    return _presets.containsKey(variantKey) || _presets.containsKey(key);
  }
}
