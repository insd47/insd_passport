import 'package:flutter/material.dart';
import "package:insd_passport/theme.dart";

// pages
import 'pages/main/main.dart';

void main() {
  runApp(const InsdPassport());
}

class InsdPassport extends StatelessWidget {
  const InsdPassport({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Passport',
      themeMode: ThemeMode.system,
      theme: InsdTheme.light,
      darkTheme: InsdTheme.dark,
      home: const MainPage(),
    );
  }
}
