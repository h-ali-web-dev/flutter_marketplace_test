// import 'package:flutter/material.dart';

// class SearchPage extends StatefulWidget {
//   SearchPage({Key? key}) : super(key: key);

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 2,
//         title: Text("Search Page"),
//         // leading: IconButton(onPressed: () {}, icon: Icon(Icons.category_sharp)),
//         // actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
//       ),
//       // body: Container(
//       //   constraints: BoxConstraints(maxWidth: 400, maxHeight: 600),
//       //   child: Expanded(
//       //     child: Padding(
//       //       padding: const EdgeInsets.all(8.0),
//       //       child: SearchAnchor(
//       //           builder: (BuildContext context, SearchController controller) {
//       //         return SearchBar(
//       //           controller: controller,
//       //           padding: const MaterialStatePropertyAll<EdgeInsets>(
//       //               EdgeInsets.symmetric(horizontal: 16.0)),
//       //           onTap: () {
//       //             controller.openView();
//       //           },
//       //           onChanged: (_) {
//       //             // print(controller.value);
//       //             controller.openView();
//       //           },
//       //           onSubmitted: (value) {
//       //             // print(value);
//       //           },
//       //           leading: const Icon(Icons.search),
//       //         );
//       //       }, suggestionsBuilder:
//       //               (BuildContext context, SearchController controller) {
//       //         return List<ListTile>.generate(5, (int index) {
//       //           final String item = 'item $index';
//       //           return ListTile(
//       //             title: Text(item),
//       //             onTap: () {
//       //               setState(() {
//       //                 controller.closeView(item);
//       //               });
//       //             },
//       //           );
//       //         });
//       //       }),
//       //     ),
//       //   ),
//       // ),
//     );
//   }
// }
