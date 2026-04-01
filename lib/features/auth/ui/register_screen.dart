import 'package:el_masar/features/auth/data/models/user_data_class.dart';
import 'package:el_masar/features/auth/services/firebase_auth_services.dart';
import 'package:el_masar/features/auth/ui/login_screen.dart';
import 'package:el_masar/features/home/ui/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:el_masar/core/widgets/custom_text_feild.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
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
                  CustomTextFeild(
                    controller: nameController,
                    hintText: 'الاسم',
                    prefixIcon: Icons.person,
                  ),

                  SizedBox(height: 20),

                  CustomTextFeild(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'البريد الالكتروني',
                    prefixIcon: Icons.email,
                  ),

                  SizedBox(height: 20),

                  CustomTextFeild(
                    keyboardType: TextInputType.number,
                    controller: phoneController,
                    hintText: 'رقم الهاتف',
                    prefixIcon: Icons.phone,
                  ),

                  SizedBox(height: 20),

                  CustomTextFeild(
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    hintText: 'كلمة المرور',
                    prefixIcon: Icons.lock,
                  ),

                  SizedBox(height: 50),

                  ElevatedButton(
                    onPressed: () async {
                      await _register(
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
                      'انشاء حساب',
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
                          text: 'لديك حساب؟ ',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),

                        TextSpan(
                          text: 'تسجيل الدخول',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
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
              height: MediaQuery.of(context).size.height * 0.7,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _register(UserDataClass userData, BuildContext context) async {
    UserCredential? userCredential = await FirebaseAuthServices.register(
      userData,
    );
    userCredential == null
        ? ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('فشل في انشاء الحساب')))
        : ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('تم انشاء الحساب بنجاح')));
  }
}
