import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbase/src/dtos/record_model.dart';
import 'package:flutter_marketplace_test/constants.dart';

class FeaturedCard extends StatelessWidget {
  late RecordModel apiData;

  FeaturedCard(this.apiData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tight(Size(300, 300)),
      child: InkWell(
        enableFeedback: true,
        excludeFromSemantics: true,
        focusColor: Colors.pink,
        child: GestureDetector(
          onTap: () {
            Get.toNamed('/details/${apiData.id}');
          },
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Image.network(
                  pocketbaseUrl +
                      '/api/files/' +
                      apiData.collectionId +
                      '/' +
                      apiData.id +
                      '/' +
                      apiData.data['image'],
                  fit: BoxFit.fill,
                  height: 200,
                ),
                ListTile(
                    title: Text(apiData.data['title']),
                    subtitle: apiData.data['sale'] != 0.0
                        ? Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  apiData.data['price'].toStringAsFixed(1),
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 12,
                                      decorationColor: Colors.red,
                                      color: Colors.grey),
                                ),
                              ),
                              Text(
                                '${apiData.data['sale']} % sale',
                              ),
                            ],
                          )
                        : null,
                    trailing: Text(
                      '\$ ${(apiData.data['price'] - (apiData.data['price'] * (apiData.data['sale'] / 100))).toStringAsFixed(1)}',
                      style: TextStyle(fontSize: 20),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
