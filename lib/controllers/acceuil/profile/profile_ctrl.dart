import 'package:get/get.dart';
import 'package:jenos_app/controllers/acceuil/profile/profile_page_state.dart';

class ProfileCtrl extends GetxController {
  var state = ProfilePageState().obs;

  void edit() {
    if (state.value.edit == true) {
      state.update((val) {
        val?.edit = false;
      });
    } else {
      state.update((val) {
        val?.edit = true;
      });
    }
  }
}
