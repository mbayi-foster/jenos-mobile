class Notification {
  int id;
  int uid;
  String message;
  bool read;
  DateTime createdAt;

  Notification({
    required this.id,
    required this.uid,
    required this.message,
    required this.read,
   DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

   factory Notification.fromJson(Map<String, dynamic> json){
  return Notification( 
     id: json["id"] ?? 0,
    uid:json['uid'] ?? 0,
    message:json['message'] ?? "",
    read:json['read'] == 1,
     createdAt: json["created_at"] != null
          ? DateTime.parse(json["created_at"])
          : DateTime.now(),);
   }
}