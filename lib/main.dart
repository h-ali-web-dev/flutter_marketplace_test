import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_marketplace_test/screens/details_page.dart';
import 'package:flutter_marketplace_test/screens/home_page.dart';
import 'package:flutter_marketplace_test/screens/login_page.dart';
import 'package:flutter_marketplace_test/screens/marketplace_page.dart';
import 'package:flutter_marketplace_test/screens/search_page.dart';
import 'package:flutter_marketplace_test/screens/settings_page.dart';
import 'package:flutter_marketplace_test/screens/sign_up_page.dart';
import 'color_schemes.g.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      unknownRoute: GetPage(name: '/notFound', page: () => Search()),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Home()),
        GetPage(name: '/details/:id', page: () => DetailsPage()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/signup', page: () => SignUpPage()),
        GetPage(name: '/search', page: () => Search()),
        GetPage(name: '/settings', page: () => SettingsPage()),
        GetPage(name: '/marketplace', page: () => MarketplacePage()),
      ],
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      themeMode: ThemeMode.system,
    );
  }
}
