import 'package:jenos_app/models/principals/notification.dart';

class NotificationsPageState {
  List<Notification> notifications;
  bool loading;
  bool hasData;
  bool visible;
  NotificationsPageState(
      {this.notifications = const [],
      this.hasData = false,
      this.loading = false,
      this.visible = false});
}
