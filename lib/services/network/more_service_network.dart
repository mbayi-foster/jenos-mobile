abstract class MoreServiceNetwork {
  Future<int?> nombreNotifictionNonLu(int id);
  Future<dynamic> modePaiement(int id);
  Future<bool> saveModePaiement(int id, dynamic modePaiement);
  Future<dynamic> getNotifications(int id);
  Future<bool> notificationisRead(int id);
  
}
