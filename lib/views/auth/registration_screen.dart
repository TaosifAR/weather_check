import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_check/controllers/auth_controller.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    final authController = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: size.height * .14),
                Image.asset(
                  'lib/assets/login.png',
                  width: size.height * .3,
                  height: size.height * .3,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: 80,
                  width: size.width - 70,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      labelText: 'Email',
                    ),
                  ),
                ),

                SizedBox(
                  height: 80,

                  width: size.width - 70,
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      labelText: 'Password',
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,

                  width: size.width - 70,
                  child: TextField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      labelText: 'Confirm password',
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                  width: size.width - 70,
                  child: ElevatedButton(
                    onPressed: () => authController.register(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                      confirmPasswordController.text.trim(),
                    ),
                    child: Text(
                      "Register",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey[900],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
