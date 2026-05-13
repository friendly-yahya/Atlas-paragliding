import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ── CLIENT ──
final clientThemeProvider =
    NotifierProvider<ClientThemeNotifier, ThemeMode>(
  ClientThemeNotifier.new,
);

class ClientThemeNotifier extends Notifier<ThemeMode> {
  static const _key = 'client_theme';

  @override
  ThemeMode build() {
    _load();
    return ThemeMode.light; // client defaults light
  }

  void _load() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString(_key);
    if (stored != null) {
      state = stored == 'dark' ? ThemeMode.dark : ThemeMode.light;
    }
  }

  void toggle() async {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, state == ThemeMode.dark ? 'dark' : 'light');
  }
}

// ── PILOT ──
final pilotThemeProvider =
    NotifierProvider<PilotThemeNotifier, ThemeMode>(
  PilotThemeNotifier.new,
);

class PilotThemeNotifier extends Notifier<ThemeMode> {
  static const _key = 'pilot_theme';

  @override
  ThemeMode build() {
    _load();
    return ThemeMode.dark; // pilot defaults dark
  }

  void _load() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString(_key);
    if (stored != null) {
      state = stored == 'light' ? ThemeMode.light : ThemeMode.dark;
    }
  }

  void toggle() async {
    state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, state == ThemeMode.dark ? 'dark' : 'light');
  }
}


final navBarVisible = StateProvider<bool>((ref) => true);