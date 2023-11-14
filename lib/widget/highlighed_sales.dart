import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_marketplace_test/constants.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:flutter_marketplace_test/pocketbase_apis/apis.dart';

class Sales extends StatefulWidget {
  const Sales({super.key});

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  late Future<List<RecordModel>> sales;
  @override
  void initState() {
    super.initState();
    sales = fetchSales();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Sales"),
              TextButton(onPressed: () {}, child: Text("View More"))
            ],
          ),
          FutureBuilder(
            future: sales,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data;
                return GridView.count(
                  crossAxisCount: context.width ~/ 150,
                  shrinkWrap: true,
                  children: [
                    for (final sale in data!)
                      SaleContainer(sale.data['message'],
                          '$pocketbaseUrl/api/files/${sale.collectionId}/${sale.id}/${sale.data['image']}')
                  ],
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}

class SaleContainer extends StatelessWidget {
  final String message;
  final String imageLink;
  const SaleContainer(
    this.message,
    this.imageLink, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 300,
      height: 100,
      margin: EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      color: Colors.teal.withOpacity(0.2),
      child: Center(
          child: Stack(fit: StackFit.expand, children: [
        Image.network(imageLink, fit: BoxFit.cover),
        Center(
          child: Text(
            message,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        )
      ])),
    );
  }
}
