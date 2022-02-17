import 'package:flutter/material.dart';
import 'package:newsapp1/model/news_model.dart';
import 'package:newsapp1/providers/news_providers.dart';
import 'package:newsapp1/screens/WholeNews.dart';
import 'package:newsapp1/services/getting_news_api.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatefulWidget {
  String url;

  NewsPage(this.url, {Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState(url);
}

class _NewsPageState extends State<NewsPage> {
  late List<NewsModel> newslist = [];
  String url;

  _NewsPageState(this.url);

  getNews() async {
    GetNewsData data = GetNewsData(url);
    newslist = await data.getNews() as List<NewsModel>;
    NewsProvider provider = Provider.of<NewsProvider>(context, listen: false);
    provider.setNewsList(newslist, url);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NewsProvider provider = Provider.of<NewsProvider>(context, listen: false);
    newslist = provider.getNewsList(url);
    if (newslist.isEmpty) getNews();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        height: (newslist.isEmpty)
            ? MediaQuery.of(context).size.height / 1.32
            : MediaQuery.of(context).size.height,
        alignment: (newslist.isEmpty) ? Alignment.center : Alignment.topLeft,
        child: (newslist.isEmpty)
            ? Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("News is on the way"),
                  CircularProgressIndicator()
                ],
              )
            : ListView.builder(
                itemCount: newslist.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Expanded(
                      child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        WholeNews(newslist[index])));
                          },
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(newslist[index].image_url),
                          radius: 25,
                        ),
                        title: Text(
                          newslist[index].title,
                          style: const TextStyle(fontSize: 20),
                        ),
                        textColor: Colors.black,
                        dense: true,
                        trailing:
                            const Icon(Icons.keyboard_arrow_right_outlined),
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
