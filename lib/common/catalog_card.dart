import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:flutter_marketplace_test/constants.dart';

class CatalogCard extends StatelessWidget {
  RecordModel item;
  CatalogCard(
    this.item, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/details/${item.id}');
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
        child: Column(
          children: [
            Image.network(
              pocketbaseUrl +
                  '/api/files/' +
                  item.collectionId +
                  '/' +
                  item.id +
                  '/' +
                  item.data['image'],
              fit: BoxFit.fill,
              height: 100,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 200, maxHeight: 100),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                title: Text(item.data['title']),
                subtitle: item.data['sale'] != 0.0
                    ? Row(
                        children: [
                          Text(
                            item.data['price'].toStringAsFixed(1),
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 10,
                                fontWeight: FontWeight.w100,
                                decorationColor: Colors.red,
                                color: Colors.white),
                          ),
                          Text(
                            ' ${item.data['sale']}% sale',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    : null,
                trailing: Text(
                    '\$${(item.data['price'] - (item.data['price'] * (item.data['sale'] / 100))).toStringAsFixed(1)}',
                    style: TextStyle(fontSize: 14)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
