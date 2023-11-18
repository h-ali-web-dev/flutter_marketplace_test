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

Future<String?> loginUser(String username, String password) async {
  String? name;
  await pb
      .collection('users')
      .authWithPassword(username, password)
      .then((value) => name = value.record?.data['username'])
      .onError((error, stackTrace) => print('error $error'));
  return name;
}

Future<bool> signupUser(String username, String email, String password,
    String confirmPassword) async {
  bool isCreated = false;

  final body = <String, dynamic>{
    "username": username,
    "email": email,
    "emailVisibility": false,
    "password": password,
    "passwordConfirm": confirmPassword
  };
  await pb.collection('users').create(body: body).then((value) {
    print('new user created');
    isCreated = true;
  }).onError((error, stackTrace) {
    print('error occured at user creation $error');
    isCreated = false;
  });

  return isCreated;
}
