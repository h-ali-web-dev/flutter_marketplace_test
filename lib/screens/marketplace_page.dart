import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_marketplace_test/pocketbase_apis/apis.dart';
import 'package:pocketbase/pocketbase.dart';

class MarketplacePage extends StatefulWidget {
  MarketplacePage({super.key});

  @override
  State<MarketplacePage> createState() => _MarketplacePageState();
}

class _MarketplacePageState extends State<MarketplacePage> {
  late Future<List<Object?>> categoryItems;

  @override
  void initState() {
    super.initState();
    categoryItems = fetchCategories();
  }

  List categoriesList = [
    {
      'name': "decor",
      "children": [
        {"name": "decor name 1", 'icon': Icons.holiday_village},
        {"name": "decor name 2", 'icon': Icons.ballot},
        {"name": "decor name 3", 'icon': Icons.vaccines},
        {"name": "decor name 4", 'icon': Icons.ac_unit},
        {"name": "decor name 5", 'icon': Icons.hail},
        {"name": "decor name 6", 'icon': Icons.villa},
      ],
    },
    {
      'name': "fashion",
      "children": [
        {"name": "fashion name 1", 'icon': Icons.shop},
        {"name": "fashion name 2", 'icon': Icons.shopping_bag},
        {"name": "fashion name 3", 'icon': Icons.shop_two},
        {"name": "fashion name 4", 'icon': Icons.shopping_cart},
        {"name": "fashion name 5", 'icon': Icons.local_print_shop_sharp},
        {"name": "fashion name 6", 'icon': Icons.privacy_tip_outlined},
      ],
    },
    {
      'name': "appliances",
      "children": [
        {"name": "appliances name 1", 'icon': Icons.shop},
        {"name": "appliances name 2", 'icon': Icons.shopping_bag},
        {"name": "appliances name 3", 'icon': Icons.shop_two},
        {"name": "appliances name 4", 'icon': Icons.shopping_cart},
        {"name": "appliances name 5", 'icon': Icons.local_print_shop_sharp},
        {"name": "appliances name 6", 'icon': Icons.privacy_tip_outlined},
        {"name": "appliances name 1", 'icon': Icons.shop},
        {"name": "appliances name 2", 'icon': Icons.shopping_bag},
        {"name": "appliances name 3", 'icon': Icons.shop_two},
        {"name": "appliances name 4", 'icon': Icons.shopping_cart},
        {"name": "appliances name 5", 'icon': Icons.local_print_shop_sharp},
        {"name": "appliances name 6", 'icon': Icons.privacy_tip_outlined},
      ],
    },
    {'name': "home", "children": []},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("select category"),
      ),
      body: Padding(
        padding: context.isLargeTablet
            ? EdgeInsets.symmetric(horizontal: 100)
            : EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: categoriesList.length,
          shrinkWrap: true,
          padding: EdgeInsets.all(10),
          itemBuilder: (context, index) {
            return Column(
              children: [
                ExpansionTile(
                  title: Text(categoriesList[index]['name']),
                  children: [
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      alignment: WrapAlignment.center,
                      children: [
                        if (categoriesList[index]['children'].isEmpty)
                          Text("no children found")
                        else
                          for (final cat in categoriesList[index]['children'])
                            CategoryIconChip(cat['name'], cat['icon']),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CategoryIconChip extends StatelessWidget {
  final String chipName;
  final IconData chipIcon;
  const CategoryIconChip(this.chipName, this.chipIcon, {super.key});

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Column(children: [Icon(chipIcon), Text(chipName)]),
      onSelected: (i) {},
    );
  }
}
