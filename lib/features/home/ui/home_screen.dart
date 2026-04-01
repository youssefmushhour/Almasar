import 'package:el_masar/features/auth/services/firebase_auth_services.dart';
import 'package:el_masar/features/auth/ui/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async{
            await FirebaseAuthServices.logout();
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}
