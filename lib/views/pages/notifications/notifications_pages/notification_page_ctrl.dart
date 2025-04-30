import 'package:get/get.dart';
import 'package:jenos_app/api/locale/auth_service_local_impl.dart';
import 'package:jenos_app/api/network/auth_service_network_impl.dart';
import 'package:jenos_app/models/principals/notification.dart';
import 'package:jenos_app/models/principals/user.dart';
import 'package:jenos_app/views/pages/notifications/notifications_pages/notifications_page_state.dart';

class NotificationPageCtrl extends GetxController {
  var state = NotificationsPageState().obs;

  void onInit() async {
    state.update((val) {
      val?.loading = true;
      val?.visible = false;
      val?.hasData = false;
    });

    AuthServiceLocalImpl apiUser = AuthServiceLocalImpl();
    User? user = await apiUser.getUser();
    AuthServiceNetworkImpl api = AuthServiceNetworkImpl();

    List<Notification> notifications =
        await api.getNotifications(user?.uid ?? 0);
    if (notifications.isNotEmpty) {
      state.update((val) {
        val?.loading = false;
        val?.visible = true;
        val?.hasData = true;
        val?.notifications = notifications;
      });
    }else{
      state.update((val) {
      val?.loading = false;
      val?.visible = false;
      val?.hasData = false;
    });
    }
  }
}
