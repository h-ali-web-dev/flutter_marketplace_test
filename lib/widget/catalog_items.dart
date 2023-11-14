import 'package:flutter/material.dart';
import 'package:flutter_marketplace_test/common/catalog_card.dart';

class CatalogItems extends StatelessWidget {
  CatalogItems({Key? key}) : super(key: key);

  List catalogList = [
    {
      'title': 'Card 1',
      'price': 34.0,
      'image': 'assets/images/headphones.jpg',
      'sale': 12
    },
    {
      'title': 'Card 2',
      'price': 1,
      'image': 'assets/images/headphones.jpg',
      'sale': 1
    },
    {
      'title': 'Card 3',
      'price': 2,
      'image': 'assets/images/headphones.jpg',
      'sale': 3
    },
    {
      'title': 'Card 4',
      'price': 55.0,
      'image': 'assets/images/headphones.jpg',
      'sale': 8
    },
    {
      'title': 'Card 5',
      'price': 346,
      'image': 'assets/images/headphones.jpg',
      'sale': 0
    },
    {
      'title': 'Card 6',
      'price': 568655,
      'image': 'assets/images/headphones.jpg',
      'sale': 99
    },
    {
      'title': 'Card 7',
      'price': 5464.0,
      'image': 'assets/images/headphones.jpg',
      'sale': 6
    },
  ];

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
                  onPressed: () {},
                  child: Row(
                    children: [Text("filter"), Icon(Icons.filter_alt_outlined)],
                  ))
            ],
          ),
          GridView.count(
            crossAxisCount: MediaQuery.of(context).size.width > 200
                ? MediaQuery.of(context).size.width ~/ 200
                : 1,
            shrinkWrap: true,
            children: [
              for (final cat in catalogList)
                CatalogCard(
                    cat['title'], cat['price'], cat['image'], cat['sale']),
            ],
          )
        ],
      ),
    );
  }
}
