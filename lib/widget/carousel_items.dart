// import 'package:flutter/material.dart';

// class CarouselItems extends StatelessWidget {
//   CarouselItems({
//     super.key,
//   });
//   final ScrollController _scrollController = ScrollController();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       width: 500,
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       constraints: BoxConstraints(maxHeight: 50, maxWidth: double.infinity),
//       child: ListView.builder(
//         controller: _scrollController,
//         scrollDirection: Axis.horizontal,
//         itemCount: 10,
//         itemBuilder: (context, index) {
//           return Container(
//             alignment: Alignment.center,
//             margin: EdgeInsets.symmetric(horizontal: 5),
//             padding: EdgeInsets.symmetric(horizontal: 5),
//             height: 50,
//             // width: 100,
//             decoration: BoxDecoration(
//                 color: Colors.amber, borderRadius: BorderRadius.circular(10)),
//             child: Text("Category",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(color: Colors.black87)),
//           );
//         },
//       ),
//     );
//   }
// }
