import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_marketplace_test/pocketbase_apis/apis.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:flutter_marketplace_test/constants.dart';

class DetailsPage extends StatelessWidget {
  // String id;
  DetailsPage({super.key});
  late String? id = Get.parameters['id'];
  late Future<RecordModel> item = fetchItemAtId(Get.parameters['id']!);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 2000),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: FutureBuilder(
              future: item,
              builder: (context, snapshot) {
                print(item);
                print(id);
                if (snapshot.hasData) {
                  var data = snapshot.data;
                  print(data?.data);
                  return Flex(
                    direction:
                        context.width > 600 ? Axis.horizontal : Axis.vertical,
                    children: [
                      Image.network(
                          '$pocketbaseUrl/api/files/${data?.collectionId}/${data?.id}/${data?.data['image']}',
                          fit: BoxFit.cover),
                      Center(
                        child: Column(children: [
                          Text(data?.data['title']),
                          Text((data!.data['price'] -
                                  (data!.data['price'] *
                                      data!.data['sale'] /
                                      100))
                              .toStringAsFixed(1)),
                          if (data!.data['sale'] > 0)
                            Text('sale of ${data!.data['sale'].toString()}')
                        ]),
                      )
                    ],
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ImageDisplay extends StatefulWidget {
  String? id;
  ImageDisplay(this.id, {super.key});

  @override
  State<ImageDisplay> createState() => _ImageDisplayState();
}

class _ImageDisplayState extends State<ImageDisplay> {
  late Future<RecordModel> sales;
  @override
  void initState() {
    super.initState();
    // sales = fetchItemAtId(id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/images/headphones.jpg'),
    );
  }
}

class DetailsPanel extends StatelessWidget {
  const DetailsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [Text("Tile"), Text("description")]),
    );
  }
}
