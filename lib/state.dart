import 'package:get/get.dart';
import 'package:flutter_marketplace_test/pocketbase_apis/apis.dart';

class StateController extends GetxController {
  var isAuthenticated = false.obs;
  setAuthentication(bool val) => isAuthenticated.value = val;

  var profileName = ''.obs;
  setProfileName(String name) => profileName.value = name;

  clearAuthState() {
    isAuthenticated.value = false;
    profileName.value = '';
  }

  var fullList = [].obs;
  getList() async {
    await fetchItems().then((value) => fullList.value = value);
  }
}
