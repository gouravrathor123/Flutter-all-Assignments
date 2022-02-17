import 'package:flutter/material.dart';
import 'package:newsapp1/model/news_model.dart';

class WholeNews extends StatefulWidget {
  NewsModel news;

  WholeNews(this.news, {Key? key}) : super(key: key);

  @override
  _WholeNewsState createState() => _WholeNewsState();
}

class _WholeNewsState extends State<WholeNews> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text(
          widget.news.description,
          style: const TextStyle(color: Colors.black,),
        ),
      ),
    );
  }
}
