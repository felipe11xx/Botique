class Comment {
  String id;
  String authorId;
  String author;
  String content;
  String postDate;

  Comment(
      {this.id,
        this.author,
        this.authorId,
        this.content,
        this.postDate,
      });

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    authorId = json['authorId'];
    author = json['author'];
    postDate = json['postDate'];
    content = json['content'];
  }


  Comment.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    author = map['author'];
    authorId = map['authorId'];
    content = map['content'];
    postDate = map['postDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['authorId'] = this.authorId;
    data['author'] = this.author;
    data['content'] = this.content;
    data['postDate'] = this.postDate;
    return data;
  }


}