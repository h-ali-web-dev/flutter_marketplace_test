import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_marketplace_test/state.dart';
import 'package:flutter_marketplace_test/pocketbase_apis/apis.dart';

Drawer myNewDrawer() {
  final StateController controller = Get.find();
  return Drawer(
    // backgroundColor: Colors.indigo,
    child: ListView(
      children: [
        DrawerHeader(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.flutter_dash), Text('Company Name')],
          ),
        ),
        Obx(() => controller.isAuthenticated.value
            ? Container(
                decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(4),
                margin:
                    EdgeInsets.only(top: 10, bottom: 5, left: 15, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.person),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        controller.profileName.value,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              )
            : Container()),
        Obx(() => controller.isAuthenticated.value
            ? ListTile(
                leading: Icon(Icons.logout),
                title: Text("Log out"),
                onTap: () {
                  pb.authStore.clear();
                  controller.clearState();
                },
              )
            : ListTile(
                leading: Icon(Icons.login),
                title: Text("Login"),
                onTap: () {
                  Get.toNamed('/login');
                },
              )),
        Divider(color: Colors.white),
        ListTile(
          leading: Icon(Icons.post_add),
          title: Text("Post Item"),
          onTap: () {
            Get.toNamed('/postItem');
          },
        ),
        ListTile(
          leading: Icon(Icons.shopping_bag),
          title: Text("marketplace"),
          onTap: () {
            Get.toNamed('/marketplace');
          },
        ),
        // ListTile(
        //   leading: Icon(Icons.collections),
        //   title: Text("Collection"),
        //   onTap: () {
        //     Get.toNamed('/test');
        //   },
        // ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("settings"),
          onTap: () {
            Get.toNamed('/settings');
          },
        ),
      ],
    ),
  );
}
