import 'package:newsapp1/envfile.dart';
import 'package:newsapp1/model/news_model.dart';
import 'package:flutter/widgets.dart';

class NewsProvider with ChangeNotifier {
  late List<NewsModel> businessNewsList = [];
  late List<NewsModel> entertainmentNewsList = [];
  late List<NewsModel> environmentNewsList = [];
  late List<NewsModel> foodNewsList = [];
  late List<NewsModel> healthNewsList = [];
  late List<NewsModel> politicsNewsList = [];
  late List<NewsModel> scienceNewsList = [];
  late List<NewsModel> sportsNewsList = [];
  late List<NewsModel> technologyNewsList = [];
  late List<NewsModel> topNewsList = [];
  late List<NewsModel> worldNewsList = [];

  setNewsList(List<NewsModel> newsList, String url) {
    if (url == URL.bussinessurl) {
      businessNewsList = newsList;
    }
    else if(url==URL.entertainmenturl){
      entertainmentNewsList=newsList;
    }
    else if(url==URL.environmenturl){
      environmentNewsList=newsList;
    }
    else if(url==URL.foodurl){
      foodNewsList=newsList;
    }
    else if(url==URL.entertainmenturl){
      healthNewsList=newsList;
    }
    else if(url==URL.politicsurl){
      politicsNewsList=newsList;
    }
    else if(url==URL.scienceurl){
      scienceNewsList=newsList;
    }
    else if(url==URL.entertainmenturl){
      sportsNewsList=newsList;
    }
    else if(url==URL.technologyurl){
      technologyNewsList=newsList;
    }
    else if(url==URL.topurl){
      topNewsList=newsList;
    }
    else if(url==URL.worldurl){
      worldNewsList=newsList;
    }
  }

  getNewsList(String url) {
    if (url == URL.bussinessurl) {
      return businessNewsList;
    }
    else if(url==URL.entertainmenturl){
      return entertainmentNewsList;
    }
    else if(url==URL.environmenturl){
      return environmentNewsList;
    }
    else if(url==URL.foodurl){
      return foodNewsList;
    }
    else if(url==URL.entertainmenturl){
      return healthNewsList;
    }
    else if(url==URL.politicsurl){
      return politicsNewsList;
    }
    else if(url==URL.scienceurl){
      return scienceNewsList;
    }
    else if(url==URL.entertainmenturl){
      return sportsNewsList;
    }
    else if(url==URL.technologyurl){
      return technologyNewsList;
    }
    else if(url==URL.topurl){
      return topNewsList;
    }
    else if(url==URL.worldurl){
      return worldNewsList;
    }
  }

}
