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
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          constraints: BoxConstraints(maxWidth: 1000, maxHeight: 1000),
          child: FutureBuilder(
            future: item,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data;
                return Flex(
                  mainAxisAlignment: MainAxisAlignment.start,
                  direction:
                      context.width > 600 ? Axis.horizontal : Axis.vertical,
                  children: [
                    ConstrainedBox(
                      constraints:
                          BoxConstraints(maxWidth: 300, maxHeight: 200),
                      child: Flexible(
                        flex: 1,
                        child: Image.network(
                          '$pocketbaseUrl/api/files/${data?.collectionId}/${data?.id}/${data?.data['image']}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(data?.data['title']),
                          Text(
                            '\$ ' +
                                (data!.data['price'] -
                                        (data.data['price'] *
                                            data.data['sale'] /
                                            100))
                                    .toStringAsFixed(1),
                          ),
                          if (data.data['sale'] > 0)
                            Text('sale of ${data.data['sale'].toString()} %'),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
