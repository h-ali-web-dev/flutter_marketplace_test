import 'package:flutter/material.dart';
import 'package:flutter_marketplace_test/common/featured_card.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:flutter_marketplace_test/pocketbase_apis/apis.dart';

class FeaturedItems extends StatefulWidget {
  const FeaturedItems({Key? key}) : super(key: key);

  @override
  State<FeaturedItems> createState() => _FeaturedItemsState();
}

class _FeaturedItemsState extends State<FeaturedItems> {
  late Future<List<RecordModel>> featureItems;
  @override
  void initState() {
    super.initState();
    featureItems = fetchItems();
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
              Text(
                "Featured Items",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              TextButton(onPressed: () {}, child: Text("View All")),
            ],
          ),
          Container(
            constraints: BoxConstraints(maxHeight: 280),
            child: FutureBuilder(
              future: featureItems,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data;
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (final featured in data!) FeaturedCard(featured),
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
