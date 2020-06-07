import 'package:botique/domain/news.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NewApi {
  static Future<List<News>> getNews() async {

    var url = 'https://gb-mobile-app-teste.s3.amazonaws.com/data.json';

    var response = await http.get(url);

  //  String json = response.body;

    List listResponse = convert.json.decode(response.body);

    final news = listResponse.map<News>((map) => News.fromJson(map)).toList();

    return news;
  }
}