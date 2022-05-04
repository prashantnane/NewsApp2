import 'package:flutter/material.dart';
import 'package:news_app/db/news_database.dart';
import 'package:news_app/widgets/news_card_widget.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/screens/news_detail_page.dart';

import 'AddEditNewsPage.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  late List<News> newsss;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();

    reFreshNewss();
  }

  @override
  void dispose() {
    NewssDatabase.instance.close();

    super.dispose();
  }

  Future reFreshNewss() async {
    setState(() => isLoading = true);

    this.newsss = await NewssDatabase.instance.readAllNewss();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Newss',
            style: TextStyle(fontSize: 24),
          ),
          actions: [Icon(Icons.search), SizedBox(width: 12)],
        ),
        body: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : newsss.isEmpty
                  ? Text(
                      'No Newss',
                      style: TextStyle(color: Colors.black, fontSize: 24),
                    )
                  : buildNewss(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(Icons.add, color: Colors.white,),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddEditNewsPage()),
            );

            reFreshNewss();
          },
        ),
      );

  Widget buildNewss() => ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        // crossAxisCount: 4,
        itemCount: newsss.length,
        // padding: EdgeInsets.all(8),

        // staggeredTileBuilder: (index) => StaggeredGridTile.fit(crossAxisCellCount: 2,child: child),

        // mainAxisSpacing: 4,
        // crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          final news = newsss[index];
          return GestureDetector(
            // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: NewsCardWidget(news: news, index: index),

            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NewsDetailPage(newsId: news.id!),
              ));

              reFreshNewss();
            },
            // child: NewsCardWidget(news: news, index: index),
          );
        },
      );
}

// ADD IF YOU HAVE NO NEWS
  // body: Center(
  // child: isLoading
  // ? CircularProgressIndicator()
  //     : news.isEmpty
  // ? Text(
  // 'No News',
  // style: TextStyle(color: Colors.white, fontSize: 24),
  // )
  //     : buildNewss(),
  // ),