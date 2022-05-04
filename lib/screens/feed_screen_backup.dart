// import 'package:flutter/material.dart';
// // import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:news_app/db/news_database.dart';
// import 'package:news_app/screens/feed_page.dart';
// import 'package:news_app/screens/feed_page.dart';
// import 'package:news_app/widgets/news_card_widget.dart';
// import 'package:news_app/models/news.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// // import 'package:news_app/db/news_database.dart';
// import 'package:news_app/screens/news_detail_page.dart';
//
// import 'AddEditNewsPage.dart';
// class FeedPage extends StatelessWidget {
//   const FeedPage({Key? key}) : super(key: key);
//
//   @override
//   _FeedPageState createState() => _FeedPageState();
//
//   Widget _buildTab(IconData iconData, String title) {
//
//     return Tab(icon: Icon(iconData), text: title);
//   }
//
//   class _FeedPageState extends State<FeedPage>{
//     late List <News> newsss;
//     bool isloading=false;
//   @override
//   void initState() {
//   super.initState();
//
//   reFreshNewss();
//   }
//   @override
//   void dispose() {
//   NewssDatabase.instance.close();
//
//   super.dispose();
//   }
//   Future reFreshNewss() async {
//   setState(() => isLoading = true);
//
//   this.newsss = await NewssDatabase.instance.readAllNewss();
//
//   setState(() => isLoading = false);
//   }
//   @override
//   Widget build(BuildContext context){
//   return DefaultTabController(
//   length: 4,
//   child: Scaffold(
//
//   appBar: AppBar(
//   flexibleSpace: Container(
//   color: Colors.white,
//   child: SafeArea(
//   child: TabBar(
//   tabs: <Widget>[
//   _buildTab(Icons.video_collection, 'Shorts'),
//   _buildTab(Icons.fiber_new, 'Latest'),
//   _buildTab(Icons.trending_up, 'Trending'),
//   _buildTab(Icons.live_tv, 'LiveTv'),
//   ],
//   ),
//   ),
//   ),
//   ),
//   body: SingleChildScrollView(
//   child: Column(
//   children: [
//   Container(
//   child: ListView.builder(
//
//   physics: NeverScrollableScrollPhysics(),
//   shrinkWrap: true,
//   itemCount: 5,
//   itemBuilder: (context,index){
//   return Container(
//   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//   child: Card(
//   shape: RoundedRectangleBorder(
//   borderRadius: BorderRadius.circular(15)),
//   elevation: 1.0,
//   child: Stack(
//   children: [
//   Center(
//   child: ClipRRect(
//   borderRadius: BorderRadius.circular(15),
//   child: Image.asset("images/news.jpg")),
//   ),
//
//   Positioned(
//   left: 0,
//   right: 0,
//   bottom: 0,
//   child: Container(
//
//   decoration: BoxDecoration(
//   borderRadius: BorderRadius.circular(15),
//   gradient: LinearGradient(
//   colors: [
//   Colors.black12.withOpacity(0),
//   Colors.black
//   ],
//   begin: Alignment.topCenter,
//   end: Alignment.bottomCenter
//   )
//   ),
//   padding: EdgeInsets.fromLTRB(15, 15, 10, 8),
//   child: Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//   Text(
//   "NEWS HEADLINE",
//   style: TextStyle(
//   color: Colors.white,
//   fontSize: 18,
//   fontWeight: FontWeight.bold),
//   ),
//   Text("BLAJH BALH BLAH BLAH..." , style: TextStyle(color: Colors.white , fontSize: 12)
//   ,)
//   ],
//   )))
//   ],
//   )),
//   );
//   }
//   )
//   )
//   ]
//   ),
//   ),
//   )
//
//   }
// }
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         appBar: AppBar(
//           flexibleSpace: Container(
//             color: Colors.white,
//             child: SafeArea(
//               child: TabBar(
//                 tabs: <Widget>[
//                   _buildTab(Icons.video_collection, 'Shorts'),
//                   _buildTab(Icons.fiber_new, 'Latest'),
//                   _buildTab(Icons.trending_up, 'Trending'),
//                   _buildTab(Icons.live_tv, 'LiveTv'),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         body:SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 child: ListView.builder(
//                   physics: NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: 5,
//                   itemBuilder: (context,index){
//                     return Container(
//                       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                       child: Card(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15)),
//                           elevation: 1.0,
//                           child: Stack(
//                             children: [
//                               Center(
//                                 child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(15),
//                                     child: Image.asset("images/news.jpg")),
//                               ),
//
//                               Positioned(
//                                   left: 0,
//                                   right: 0,
//                                   bottom: 0,
//                                   child: Container(
//
//                                       decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(15),
//                                           gradient: LinearGradient(
//                                               colors: [
//                                                 Colors.black12.withOpacity(0),
//                                                 Colors.black
//                                               ],
//                                               begin: Alignment.topCenter,
//                                               end: Alignment.bottomCenter
//                                           )
//                                       ),
//                                       padding: EdgeInsets.fromLTRB(15, 15, 10, 8),
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             "NEWS HEADLINE",
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 18,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                           Text("BLAJH BALH BLAH BLAH..." , style: TextStyle(color: Colors.white , fontSize: 12)
//                                             ,)
//                                         ],
//                                       )))
//                             ],
//                           )),
//                     );
//                   }
//
//                 ),
//
//               )
//             ],
//           ),
//         ),
//         ),
//     );
//
//   }
// }
//
// // FLOTING BUTTON
// // floatingActionButton: FloatingActionButton(
// // backgroundColor: Colors.black,
// // child: Icon(Icons.add),
// // onPressed: () async {
// // await Navigator.of(context).push(
// // MaterialPageRoute(builder: (context) => AddEditNewsPage()),
// // );
// //
// // reFreshNewss();
// // },
// // ),