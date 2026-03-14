import 'package:el_masar/features/auth/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Elmasar());
}

class Elmasar extends StatelessWidget {
  const Elmasar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}
