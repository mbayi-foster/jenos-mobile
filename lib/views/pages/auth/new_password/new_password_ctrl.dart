import 'package:get/get.dart';
import 'package:jenos_app/views/pages/auth/new_password/new_password_state.dart';

class NewPasswordCtrl extends GetxController{
  var state = NewPasswordState().obs;
    @override
  onInit() {
    final args = Get.arguments;
    if (args == null || !args.containsKey('page')) {
      state.value.lastPage = 'check';
    } else {
      state.value.lastPage = 'register';
    }
    super.onInit();
  }
}