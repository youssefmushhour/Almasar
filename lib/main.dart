import 'package:device_preview/device_preview.dart';
import 'package:el_masar/features/auth/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(Elmasar());
  // DevicePreview(
  // enabled: true,
  // builder: (context) => const Elmasar(),
  // ),
 
}

class Elmasar extends StatelessWidget {
  const Elmasar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // useInheritedMediaQuery: true,
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
