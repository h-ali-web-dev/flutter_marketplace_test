import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalogCard extends StatelessWidget {
  String imageData;
  String title;
  num price;
  int sale;
  CatalogCard(
    this.title,
    this.price,
    this.imageData,
    this.sale, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('catalog card pressed');
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
        child: Column(
          children: [
            Image.asset(
              imageData,
              fit: BoxFit.contain,
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              // leading: Icon(Icons.trolley),
              title: Text(title),
              subtitle: sale != 0.0
                  ? Row(
                      children: [
                        Text(
                          price.toStringAsFixed(1),
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 10,
                              fontWeight: FontWeight.w100,
                              decorationColor: Colors.red,
                              color: Colors.white),
                        ),
                        Text(
                          ' $sale% sale',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    )
                  : null,
              trailing: Text(
                  '\$${(price - (price * (sale / 100))).toStringAsFixed(1)}',
                  style: TextStyle(fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }
}
