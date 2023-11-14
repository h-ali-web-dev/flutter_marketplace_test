import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_marketplace_test/pocketbase_apis/apis.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
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
                onPressed: () {
                  final body = <String, dynamic>{
                    "username": usernameController.text,
                    "email": emailController.text,
                    "emailVisibility": false,
                    "password": passwordController.text,
                    "passwordConfirm": confirmPasswordController.text
                  };
                  pb.collection('users').create(body: body).then((value) {
                    print('new user created');
                    Get.toNamed('/login');
                  }).onError((error, stackTrace) {
                    print('error occured');
                  });
                },
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
            ],
          ),
        ),
      ),
    );
  }
}
