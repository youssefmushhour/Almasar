import 'package:flutter/material.dart';
import 'package:el_masar/core/widgets/custom_text_feild.dart';

class RegScreen extends StatelessWidget {
  const RegScreen({super.key});

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
                  

                  CustomTextFeild(hintText: 'الاسم', prefixIcon: Icons.person),

                  SizedBox(height: 20),

                  CustomTextFeild(
                    hintText: 'البريد الالكتروني',
                    prefixIcon: Icons.email,
                  ),

                  SizedBox(height: 20),

                  CustomTextFeild(
                    hintText: 'رقم الهاتف',
                    prefixIcon: Icons.phone,
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
                      'انشاء حساب',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 22,
                      ),
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
}
