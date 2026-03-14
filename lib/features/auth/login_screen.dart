import 'package:el_masar/features/auth/reg_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:el_masar/core/widgets/custom_text_feild.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                      fontSize: 25,
                      color: Colors.white,
                      fontFamily: 'Changa',
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    'من فضلك قم بتسجيل الدخول',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontFamily: 'Changa',
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 40),

                  CustomTextFeild(
                    hintText: 'رقم الهاتف',
                    prefixIcon: Icons.person,
                  ),

                  SizedBox(height: 20),

                  CustomTextFeild(
                    hintText: 'كلمة المرور',
                    prefixIcon: Icons.lock,
                  ),

                  SizedBox(height: 50),

                  ElevatedButton(
                    onPressed: () {},

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

                  SizedBox(height: 20),

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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegScreen(),
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
}
