import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_marketplace_test/common/my_app_bar.dart';
import 'package:flutter_marketplace_test/common/my_drawer.dart';
import 'package:flutter_marketplace_test/widget/catalog_items.dart';
import 'package:flutter_marketplace_test/widget/category_chips.dart';
import 'package:flutter_marketplace_test/widget/featured_items.dart';
import 'package:flutter_marketplace_test/widget/highlighed_sales.dart';
import 'package:flutter_marketplace_test/state.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StateController controller = Get.put(StateController());
    return Scaffold(
      appBar: myAppBar('Home Page'),
      drawer: myNewDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FeaturedItems(),
            Sales(),
            CategoryChips(),
            CatalogItems(),
            Center(
              child: SizedBox(
                width: 250,
                child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/search');
                    },
                    child: ListTile(
                      title: Text("Search More"),
                      trailing: Icon(Icons.search),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
