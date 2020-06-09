import 'news.dart';

class NewsList {
  List<News> news;

  NewsList({this.news});

  NewsList.fromJson(Map<String, dynamic> json) {
    if (json['news'] != null) {
      news = new List<News>();
      json['news'].forEach((v) {
        news.add(new News.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.news != null) {
      data['news'] = this.news.map((v) => v.toJson()).toList();
    }
    return data;
  }
}