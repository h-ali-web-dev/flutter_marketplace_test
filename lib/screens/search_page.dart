import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_marketplace_test/pocketbase_apis/apis.dart';
import 'package:pocketbase/pocketbase.dart';

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Future<List<RecordModel>>? searchResults;
  final searchTextController = TextEditingController();

  void _search() {
    searchResults = null;
    searchResults = fetchItemsWithFilter(searchTextController.text);
  }

  void initState() {
    _search();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                  padding: EdgeInsets.all(5),
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back)),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: SearchBar(
                      controller: searchTextController,
                      hintText: 'Search here',
                      // onChanged: (value) {
                      //   if (value.isNotEmpty) {
                      //     _search();
                      //   }
                      // },
                      trailing: [
                        IconButton(
                          icon: Icon(Icons.filter_alt),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            _search();
                          },
                        )
                      ]),
                ),
              ),
            ],
          ),
          Flexible(
              child: Container(
                  padding: context.isTablet
                      ? EdgeInsets.symmetric(horizontal: 100)
                      : EdgeInsets.all(10),
                  child: FutureBuilder(
                    future: searchResults,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data;
                        return ListView(
                          children: [
                            for (final item in data!)
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                alignment: Alignment.center,
                                child: Text(
                                  item.data['title'],
                                  style: TextStyle(fontSize: 20),
                                ),
                              )
                          ],
                        );
                      }
                      return Text("no results");
                    },
                  )))
        ],
      ),
    );
  }
}
