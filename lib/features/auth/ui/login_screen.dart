import 'package:el_masar/features/auth/data/models/user_data_class.dart';
import 'package:el_masar/features/auth/services/firebase_auth_services.dart';
import 'package:el_masar/features/auth/ui/register_screen.dart';
import 'package:el_masar/features/home/ui/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:el_masar/core/widgets/custom_text_feild.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/almasar.jpeg',
              //fit: BoxFit.coer,
            ),
          ),

          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.only(top: 30, left: 30, right: 30),
              child: Column(
                children: [
                  Text(
                    'أهلا بك نحن سعداء بعودتك',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontFamily: 'Changa',
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    'من فضلك قم بتسجيل الدخول',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontFamily: 'Changa',
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 30),

                  CustomTextFeild(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    hintText: 'البريد الالكتروني',
                    prefixIcon: Icons.email,
                  ),

                  SizedBox(height: 10),

                  CustomTextFeild(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    hintText: 'كلمة المرور',
                    prefixIcon: Icons.lock,
                  ),

                  SizedBox(height: 50),

                  ElevatedButton(
                    onPressed: () async {
                     await _login(
                        UserDataClass(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        ),
                        context,
                      );
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (route) => false,
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fixedSize: Size(300, 60),
                    ),
                    child: Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 22,
                      ),
                    ),
                    
                  ),

                  SizedBox(height: 10),

                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'ليس لديك حساب؟ ',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: 'Changa',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'تسجيل حساب جديد',

                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ),
                              );
                            },
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: 'Changa',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              decoration: BoxDecoration(
                color: Color(0xff1380A5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _login(UserDataClass userData, BuildContext context) async {
    UserCredential? userCredential = await FirebaseAuthServices.login(userData);
    userCredential == null
        ? ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('فشل في تسجيل الدخول')))
        : ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('تم تسجيل الدخول بنجاح')));
  }
}
