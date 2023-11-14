import 'package:pocketbase/pocketbase.dart';
import 'package:flutter_marketplace_test/constants.dart';

final pb = PocketBase(pocketbaseUrl);

Future<List<RecordModel>> fetchItems() async {
  final List<RecordModel> items = await pb.collection('catalog').getFullList(
        sort: '-created',
      );
  return items;
}

Future<List<RecordModel>> fetchItemsWithFilter(String name) async {
  final List<RecordModel> results = await pb
      .collection('catalog')
      .getFullList(sort: '-created', filter: 'title~"$name"');
  return results;
}

Future<RecordModel> fetchItemAtId(String id) async {
  final RecordModel result = await pb.collection('catalog').getOne(id);
  return result;
}

Future<List<RecordModel>> fetchSales() async {
  final List<RecordModel> sales =
      await pb.collection('sale').getFullList(sort: '-created');
  return sales;
}
