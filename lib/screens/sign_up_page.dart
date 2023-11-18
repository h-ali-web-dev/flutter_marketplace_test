import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_marketplace_test/pocketbase_apis/apis.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    var isError = false.obs;

    void signupPressed() async {
      bool userCreationState = await signupUser(
          usernameController.text,
          emailController.text,
          passwordController.text,
          confirmPasswordController.text);
      if (userCreationState == true) {
        isError.value = false;
        Get.toNamed('/login');
      } else {
        isError.value = true;
      }
    }

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 500),
          margin: context.isTablet
              ? EdgeInsets.symmetric(horizontal: 100)
              : EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Sign Up", style: TextStyle(fontSize: 24)),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  icon: Icon(Icons.email),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  icon: Icon(Icons.person),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  icon: Icon(Icons.password),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              TextField(
                obscureText: true,
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  icon: Icon(Icons.password_outlined),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              ElevatedButton(
                onPressed: signupPressed,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.login),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                    Text("Sign Up"),
                  ],
                ),
              ),
              Obx(() => isError.value
                  ? Text(
                      'An Error has occured on Sign Up!',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.red,
                          backgroundColor: Colors.black12),
                    )
                  : Container()),
            ],
          ),
        ),
      ),
    );
  }
}
