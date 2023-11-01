class CommentModel {
  int? id;
  String? body;
  String? user;

  CommentModel({this.body, this.id, this.user});

  CommentModel.fromJson(Map json) {
    this.id = json["id"];
    this.body = json["body"];
    this.user = json["user"]["username"];
  }
}
