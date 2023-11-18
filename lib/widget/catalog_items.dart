import 'package:flutter/material.dart';
import 'package:flutter_marketplace_test/common/catalog_card.dart';
import 'package:flutter_marketplace_test/pocketbase_apis/apis.dart';
import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';

class CatalogItems extends StatefulWidget {
  CatalogItems({Key? key}) : super(key: key);

  @override
  State<CatalogItems> createState() => _CatalogItemsState();
}

class _CatalogItemsState extends State<CatalogItems> {
  late Future<List<RecordModel>> catalogItems;

  @override
  void initState() {
    super.initState();
    catalogItems = fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Catalog"),
              TextButton(
                  onPressed: () {
                    Get.toNamed('/search');
                  },
                  child: Row(
                    children: [Text("filter"), Icon(Icons.filter_alt_outlined)],
                  ))
            ],
          ),
          Container(
            child: FutureBuilder(
              future: catalogItems,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data;
                  return Wrap(
                    alignment: WrapAlignment.center, spacing: 10,
                    // scrollDirection: Axis.horizontal,
                    children: [
                      for (final featured in data!) CatalogCard(featured),
                    ],
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}
