import 'package:flutter/material.dart';
import 'package:rhymer/router/router.dart';

void main() {
  runApp(const RhymerApp());
}

class RhymerApp extends StatefulWidget {
  const RhymerApp({super.key});

  @override
  State<RhymerApp> createState() => _RhymerAppState();
}

class _RhymerAppState extends State<RhymerApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    const primaryColor = Colors.purple;
    return MaterialApp.router(
      routerConfig: _router.config(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFEFF1F3),
        primarySwatch: primaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      ),
    );
  }
}
