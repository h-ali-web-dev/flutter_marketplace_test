import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white12),
          child: ListView(
            children: [
              ListTile(
                  leading: Icon(Icons.dark_mode),
                  title: Text("Dark Theme"),
                  trailing: Switch(
                      value: context.isDarkMode,
                      onChanged: (i) {
                        Get.isDarkMode
                            ? Get.changeThemeMode(ThemeMode.light)
                            : Get.changeThemeMode(ThemeMode.dark);
                      }))
            ],
          )),
    );
  }
}
