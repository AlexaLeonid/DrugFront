import 'package:flutter/material.dart';
import 'search_bar.dart';
import 'side_menu.dart';

class MyHomePage extends StatelessWidget {
  final Function(ThemeMode) onThemeChange; // ??????? ????????? ????

  const MyHomePage({super.key, required this.onThemeChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('’”À» œﬂÀ»ÿ‹'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          ThemeButton(onThemeChange: onThemeChange), // ???????? ??????? ????????? ????
        ],
      ),
      body: const App(),
      drawer: const MyDrawer(),
    );
  }
}

class ThemeButton extends StatefulWidget {
  final Function(ThemeMode) onThemeChange; // ??????? ????????? ????

  const ThemeButton({super.key, required this.onThemeChange});

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  bool isDark = false; // ?????????? ??? ???????????? ??????

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Change brightness mode',
      child: IconButton(
        onPressed: () {
          setState(() {
            isDark = !isDark;
            widget.onThemeChange(isDark ? ThemeMode.dark : ThemeMode.light); // ???????? themeMode ? MyApp
          });
        },
        icon: Icon(
          isDark ? Icons.light_mode : Icons.dark_mode,
        ),
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SearchBarDrug(),
    );
  }
}
