import 'package:botique/bloc/simple_bloc.dart';
import 'package:botique/domain/news_list.dart';
import 'package:botique/network/api_news.dart';

class NewsBloc extends SimpleBloc<NewsList>{

  fetch() async{
    try{
      NewsList newsList = await NewsApi.getBoticarioNews();
          add(newsList);
    }on Exception catch(e){
      addError(e);
    }
  }
}