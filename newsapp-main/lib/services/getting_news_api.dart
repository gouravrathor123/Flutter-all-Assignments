import 'dart:convert';

import 'package:newsapp1/model/news_model.dart';
import 'package:http/http.dart' as http;

class GetNewsData {
  List<NewsModel> newslist=[];
  String url;
  GetNewsData(this.url);
  Future<List> getNews()async{
    Uri uri=Uri.parse(url);
    final response = await http.get(uri);
    print(response.body.toString());
    try{
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body)['results'];
        for (int i = 0; i < data.length; ++i) {
          if (data[i]['image_url'] != null) {
            newslist.add(NewsModel.fromJson(data[i]));
          }
        }
      }
    }catch(e){
      throw Error();
    }
    return newslist;
  }
}