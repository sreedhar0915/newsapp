import 'package:flutter/material.dart';
import 'package:newsapp/controller/homescreen_controller.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
      await context.read<HomescreenController>().getnewslist();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text("DAILY NEWS",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            actions: [
              Icon(Icons.newspaper),
              SizedBox(width: 10),
            ],
          ),
          body: Consumer<HomescreenController>(
            builder: (context, homeproviderobj, child) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Daily Updated News",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue)),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'SEARCH',
                        fillColor: Colors.blue,
                        hintText: ("SEARCH ANYTHING"),
                        suffixIcon: Icon(Icons.newspaper),
                        suffix: Icon(Icons.newspaper),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 3)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.black, width: 3)),
                      ),
                    ),
                    SizedBox(height: 20),
                    const TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: Colors.white,
                      labelStyle: TextStyle(fontSize: 12),
                      unselectedLabelColor: Colors.blue,
                      indicator: BoxDecoration(
                        color: Colors.blue,
                      ),
                      tabs: [
                        Tab(
                          text: "All News",
                        ),
                        Tab(
                          text: "Politics News",
                        ),
                        Tab(
                          text: "Sports News",
                        ),
                        Tab(
                          text: "Socialcrises",
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 400,
                      child: TabBarView(
                        children: [
                          SizedBox(
                            height: 400,
                            child: ListView.separated(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 200,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  homeproviderobj
                                                      .articlelist[index]
                                                      .urlToImage
                                                      .toString()),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  homeproviderobj
                                                      .articlelist[index].url
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          homeproviderobj
                                              .articlelist[index].title
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          homeproviderobj
                                              .articlelist[index].publishedAt
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              separatorBuilder: (context, index) => SizedBox(
                                width: 20,
                                height: 10,
                              ),
                              itemCount: homeproviderobj.articlelist
                                  .length, //homeproviderobj.articlelist.length,
                            ),
                          ),
                          Center(child: Text("Politics News")),
                          Center(child: Text("Sports News")),
                          Center(child: Text("Social Crises News")),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//  Navigator.push  CustomNewsCard(
//                                 url: homeproviderobj.articlelist[index].url
//                                     .toString(),
//                                 publishedAt: homeproviderobj
//                                     .articlelist[index].publishedAt,
//                                 source:
//                                     homeproviderobj.articlelist[index].source,
//                                 title: homeproviderobj.articlelist[index].title
//                                     .toString(),
//                                 description: homeproviderobj
//                                     .articlelist[index].description
//                                     .toString(),
//                                 author: homeproviderobj
//                                     .articlelist[index].author
//                                     .toString(),
//                                 urlToImage: homeproviderobj
//                                     .articlelist[index].urlToImage
//                                     .toString(),
//                               ),

// import 'package:flutter/material.dart';
// import 'package:newsapp/controller/homescreen_controller.dart';
// import 'package:newsapp/view/Global%20widget/custom_news_card.dart';
// import 'package:provider/provider.dart';

// class Homescreen extends StatelessWidget {
//   const Homescreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4, // Number of tabs
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blue,
//           title: Text("ABC NEWS",
//               style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white)),
//           actions: [
//             Icon(Icons.newspaper),
//             SizedBox(width: 10),
//           ],
//         ),
//         body: Consumer<HomescreenController>(
//           builder: (context, homeproviderobj, child) => SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Text("Daily Updated News",
//                           style: TextStyle(
//                               fontSize: 30,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.blue)),
//                       Spacer(),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   TextField(
//                     decoration: InputDecoration(
//                       labelText: 'SEARCH',
//                       fillColor: Colors.blue,
//                       hintText: ("SEARCH ANYTHING"),
//                       suffix: Icon(Icons.newspaper),
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(color: Colors.blue, width: 3)),
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide:
//                               BorderSide(color: Colors.black, width: 3)),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   const TabBar(
//                     indicatorSize: TabBarIndicatorSize.tab,
//                     labelColor: Colors.white,
//                     labelStyle: TextStyle(fontSize: 12),
//                     unselectedLabelColor: Colors.blue,
//                     indicator: BoxDecoration(
//                       color: Colors.blue,
//                     ),
//                     tabs: [
//                       Tab(
//                         text: "All News",
//                       ),
//                       Tab(
//                         text: "Politics News",
//                       ),
//                       Tab(
//                         text: "Sports News",
//                       ),
//                       Tab(
//                         text: "Social crisics News",
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Expanded(
//                     child: TabBarView(
//                       children: [
//                         SizedBox(
//                           height: 280,
//                           child: ListView.separated(
//                               padding: EdgeInsets.symmetric(horizontal: 20),
//                               scrollDirection: Axis.vertical,
//                               itemBuilder: (context, index) => CustomNewsCard(
//                                     oncardTap: () {
//                                       // Navigator.push(
//                                       //     context,
//                                       //     MaterialPageRoute(
//                                       //         builder: (context) => Recipedetials(
//                                       //               recipetitle: DummyDb.trendingnowlist[index]
//                                       //                   ["title"],
//                                       //               recipeimage: DummyDb.trendingnowlist[index]
//                                       //                   ["bgimage"],
//                                       //               reciperating: DummyDb.trendingnowlist[index]
//                                       //                   ["rating"],
//                                       //               recipeprofileimage: DummyDb
//                                       //                   .trendingnowlist[index]["userurl"],
//                                       //               recipeusername: DummyDb
//                                       //                   .trendingnowlist[index]["username"],
//                                       //             )));
//                                     },
//                                     url: homeproviderobj.articlelist[index].url
//                                         .toString(),
//                                     publishedAt: homeproviderobj
//                                         .articlelist[index].publishedAt,
//                                     source: homeproviderobj
//                                         .articlelist[index].source,
//                                     title: homeproviderobj
//                                         .articlelist[index].title
//                                         .toString(),
//                                     description: homeproviderobj
//                                         .articlelist[index].description
//                                         .toString(),
//                                     author: homeproviderobj
//                                         .articlelist[index].author
//                                         .toString(),
//                                     urlToImage: homeproviderobj
//                                         .articlelist[index].urlToImage
//                                         .toString(),
//                                   ),
//                               separatorBuilder: (context, index) =>
//                                   SizedBox(width: 16),
//                               itemCount: homeproviderobj.articlelist.length),
//                         ),
//                         Center(child: Text("Politics News")),
//                         Center(child: Text("Sports News")),
//                         Center(child: Text("Social Crises News")),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

 // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Recipedetials(
                                  //               recipetitle: DummyDb.trendingnowlist[index]
                                  //                   ["title"],
                                  //               recipeimage: DummyDb.trendingnowlist[index]
                                  //                   ["bgimage"],
                                  //               reciperating: DummyDb.trendingnowlist[index]
                                  //                   ["rating"],
                                  //               recipeprofileimage: DummyDb
                                  //                   .trendingnowlist[index]["userurl"],
                                  //               recipeusername: DummyDb
                                  //                   .trendingnowlist[index]["username"],
                                  //             )));