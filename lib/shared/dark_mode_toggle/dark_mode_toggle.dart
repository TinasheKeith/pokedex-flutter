import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:pokedex_app/notifiers/theme_mode_notifier.dart';
import 'package:provider/provider.dart';

class DarkModeToggle extends StatefulWidget {
  @override
  _DarkModeToggleState createState() => _DarkModeToggleState();
}

class _DarkModeToggleState extends State<DarkModeToggle> {
  final FlareControls _controls = FlareControls();

  bool _isDarkMode = false;
  String animation = "day_idle";

  void toggleDarkMode() {
    setState(() {
      if (_isDarkMode) {
        animation = "switch_day";
      } else {
        animation = "switch_night";
      }
      _isDarkMode = !_isDarkMode;
    });
  }

  String getAnimation() {
    if (_isDarkMode) return "night_idle";
    if (!_isDarkMode) return "day_idle";
    return "night_idle";
  }

  @override
  Widget build(BuildContext context) {
    AppThemeMode appTheme = Provider.of<AppThemeMode>(context);

    switchMode() {
      appTheme.toggleIsDarkMode();
      if (appTheme.isDarkMode) {
        animation = "switch_day";
      } else {
        animation = "switch_night";
      }
    }

    return GestureDetector(
      onTap: switchMode,
      child: SizedBox(
        height: 40,
        width: 100,
        child: FlareActor(
          'assets/flare/darkmode-toggle.flr',
          controller: _controls,
          animation: animation,
        ),
      ),
    );
  }
}
