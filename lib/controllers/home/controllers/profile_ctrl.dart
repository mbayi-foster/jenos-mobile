import 'package:get/get.dart';
import 'package:jenos_app/controllers/home/states/profile_page_state.dart';

class ProfileCtrl extends GetxController {
  ProfilePageState state = ProfilePageState();

  void edit() {
    if (state.edit == true) {
      state = state.copyWith(edit: false);
      update();
    } else {
      state = state.copyWith(edit: true);
      update();
    }
  }
}
