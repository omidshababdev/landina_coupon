class NotifModel {
  String? id;
  String? title;
  String? body;
  String? channelKey;
  String? bigPicture;

  NotifModel({
    this.id,
    this.title,
    this.body,
    this.channelKey,
    this.bigPicture,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': title,
      'body': body,
      'image': channelKey,
      'email': bigPicture,
    };
  }

  factory NotifModel.fromJson(Map<String, dynamic> map) {
    return NotifModel(
      id: map['_id'],
      title: map['title'],
      body: map['body'],
      channelKey: map['channelKey'],
      bigPicture: map['bigPicture'],
    );
  }
}
