class LinkModel {
  String id;
  String userId;
  String name;
  String desc;
  String link;
  bool active;

  LinkModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.desc,
    required this.link,
    required this.active,
  });

  factory LinkModel.fromJson(Map<String, dynamic> map) {
    return LinkModel(
      id: map['_id'],
      userId: map['userId'],
      name: map['name'],
      desc: map['desc'],
      link: map['link'],
      active: map['active'],
    );
  }
}
