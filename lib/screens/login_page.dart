import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_marketplace_test/state.dart';
import 'package:flutter_marketplace_test/constants.dart';
import 'package:flutter_marketplace_test/pocketbase_apis/apis.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  var isError = false.obs;
  final StateController controller = Get.find();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void loginPressed() async {
    String? res =
        await loginUser(usernameController.text, passwordController.text);
    String? name = res;
    if (name != null) {
      isError.value = false;
      controller.setAuthentication(true);
      controller.profileName.value = name;
      Get.toNamed('/');
    } else {
      isError.value = true;
      controller.clearAuthState();
    }
  }

  @override
  Widget build(BuildContext context) {
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
              Text("Enter Credentials", style: TextStyle(fontSize: 24)),
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
              Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: loginPressed,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.login),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                        Text("Login"),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/signup');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.app_registration),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                        Text("Sign Up"),
                      ],
                    ),
                  ),
                ],
              ),
              Obx(
                () => isError.value
                    ? Text(
                        'An Error has occured on Login!',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.red,
                          backgroundColor: Colors.black12,
                        ),
                      )
                    : Container(),
              ),
              Text(
                'test login credentials: \nusername: username1 \npassword: username1',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
