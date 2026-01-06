import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_check/controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                  height: 60,
                  width: size.width - 70,
                  child: ElevatedButton(
                    onPressed: () => authController.login(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey[900],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed('/register');
                  },
                  child: Text("Register/Sign up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
