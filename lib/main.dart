import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'features/qrcode.dart'; // For generating the visual QR


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // you can add a themeData whe you want a unified theme format
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor:  Colors.blueAccent, // <--- YOUR CUSTOM COLOR HERE
          brightness: Brightness.light,
        ),
      ),
      home: DashboardScreen(),
    );
  }
}
