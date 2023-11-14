import 'package:get/get.dart';

class StateController extends GetxController {
  var isAuthenticated = false.obs;
  setAuthentication(bool val) => isAuthenticated.value = val;

  var profileName = ''.obs;
  setProfileName(String name) => profileName.value = name;

  clearState() {
    isAuthenticated.value = false;
    profileName.value = '';
  }
}
