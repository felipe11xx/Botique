import 'package:botique/domain/news_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NewsApi {
  static Future<NewsList> getBoticarioNews() async {

    var url = 'https://gb-mobile-app-teste.s3.amazonaws.com/data.json';

    var response = await http.get(url);

    Map map = convert.json.decode(convert.utf8.decode(response.bodyBytes));
    final newsList =  NewsList.fromJson(map);   //listResponse.map<News>((map) => NewsList.fromJson(map)).toList();

    return newsList;
  }
}