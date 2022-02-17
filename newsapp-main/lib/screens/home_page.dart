import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp1/envfile.dart';
import 'package:newsapp1/screens/newspage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 11,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("NewsApp"),
          elevation: 0,
          bottom: const TabBar(
            padding: EdgeInsets.only(left: 12, right: 10),
            isScrollable: true,
            labelPadding: EdgeInsets.all(7),
            indicatorColor: Colors.white,
            tabs: [
              Text(
                'Business',
                style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),
              ),
              Text(
                'Entertainment',
                style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),
              ),
              Text(
                'Environment',
                style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),
              ),
              Text(
                'Food',
                style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),
              ),
              Text(
                'Health',
                style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),
              ),
              Text(
                'Politics',
                style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),
              ),
              Text(
                'Sports',
                style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),
              ),
              Text(
                'Science',
                style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),
              ),
              Text(
                'Technology',
                style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),
              ),
              Text(
                'Top',
                style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),
              ),
              Text(
                'World',
                style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          NewsPage(URL.bussinessurl),
          NewsPage(URL.entertainmenturl),
          NewsPage(URL.environmenturl),
          NewsPage(URL.foodurl),
          NewsPage(URL.healthurl),
          NewsPage(URL.politicsurl),
          NewsPage(URL.scienceurl),
          NewsPage(URL.sportsurl),
          NewsPage(URL.technologyurl),
          NewsPage(URL.topurl),
          NewsPage(URL.worldurl),
        ],),
      ),
    );
  }
}
