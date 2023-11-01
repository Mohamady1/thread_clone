class PostModel {
  int? id;
  String? user;
  String? body;
  int? reactions;
  String? image;
  bool love = false;

  PostModel({
    this.id,
    this.user,
    this.body,
    this.reactions,
    this.image,
    required this.love,
  });

  PostModel.fromJson(Map json) {
    this.body = json["body"];
    this.id = json["id"];
    this.user = json["user"]["username"];
    this.reactions = json["reactions"];
    this.image = json["user"]["image"];
  }

  PostModel.fromFakePostJson(Map json) {
    this.body = json["body"];
    this.id = json["id"];
    this.user = json["user"];
    this.reactions = int.parse(json["reactions"]);
    this.image = json["image"];
  }
}
