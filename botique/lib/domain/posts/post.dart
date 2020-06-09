class Post {
  String id;
  String authorId;
  String author;
  String postContent;
  String postDate;

  Post(
      {this.id,
        this.author,
        this.authorId,
        this.postContent,
        this.postDate,
      });

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    authorId = json['authorId'];
    author = json['author'];
    postDate = json['postDate'];
    postContent = json['postContent'];
  }


  Post.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    author = map['author'];
    authorId = map['authorId'];
    postContent = map['postContent'];
    postDate = map['postDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['authorId'] = this.authorId;
    data['author'] = this.author;
    data['postDate'] = this.postDate;
    data['postContent'] = this.postContent;
    return data;
  }


}