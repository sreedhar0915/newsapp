import 'package:flutter/material.dart';
import 'package:newsapp/controller/homescreen_controller.dart';
import 'package:newsapp/view/DummyDB/dummydb.dart';
import 'package:newsapp/view/Global%20widget/newsdetail_card.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final TextEditingController searchController = TextEditingController();
  String currentCategory = Dummydb.categories[0];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
      await context.read<HomescreenController>().getnewslist(currentCategory);
      searchController.addListener(() {
        context
            .read<HomescreenController>()
            .searchArticles(searchController.text);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Dummydb.categories.length, // Number of tabs
      child: SafeArea(
        child: Scaffold(
          appBar: appbar(),
          body: SingleChildScrollView(
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
                  textfield(),
                  SizedBox(height: 20),
                  tabbar(context),
                  SizedBox(height: 20),
                  consumerandtabbarview(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Consumer<HomescreenController> consumerandtabbarview() {
    return Consumer<HomescreenController>(
      builder: (context, homeproviderobj, child) => homeproviderobj.isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: 400,
              child: TabBarView(
                children: [
                  // All News Tab
                  SizedBox(
                    height: 400,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewsdetailCard(
                                      author: homeproviderobj
                                          .filteredArticles[index].author
                                          .toString(),
                                      title: homeproviderobj
                                          .filteredArticles[index].title
                                          .toString(),
                                      description: homeproviderobj
                                          .filteredArticles[index].description
                                          .toString(),
                                      urlToImage: homeproviderobj
                                          .filteredArticles[index].urlToImage
                                          .toString(),
                                      publishedAt: homeproviderobj
                                          .filteredArticles[index].publishedAt,
                                      url: homeproviderobj.filteredArticles[index].url
                                          .toString(),
                                      source: homeproviderobj.filteredArticles[index].source)));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 200,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: NetworkImage(homeproviderobj
                                          .filteredArticles[index].urlToImage
                                          .toString()),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  homeproviderobj.filteredArticles[index].title
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  homeproviderobj
                                      .filteredArticles[index].publishedAt
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
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
                      itemCount: homeproviderobj.filteredArticles.length,
                    ),
                  ),
                  // politics news
                  SizedBox(
                    height: 400,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewsdetailCard(
                                      author: homeproviderobj
                                          .articlelist[index].author
                                          .toString(),
                                      title: homeproviderobj
                                          .articlelist[index].title
                                          .toString(),
                                      description: homeproviderobj
                                          .articlelist[index].description
                                          .toString(),
                                      urlToImage: homeproviderobj
                                          .articlelist[index].urlToImage
                                          .toString(),
                                      publishedAt: homeproviderobj
                                          .articlelist[index].publishedAt,
                                      url: homeproviderobj.articlelist[index].url
                                          .toString(),
                                      source: homeproviderobj.articlelist[index].source)));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 200,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: NetworkImage(homeproviderobj
                                          .filteredArticles[index].urlToImage
                                          .toString()),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  homeproviderobj.filteredArticles[index].title
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  homeproviderobj
                                      .filteredArticles[index].publishedAt
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
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
                      itemCount: homeproviderobj.filteredArticles.length,
                    ),
                  ),
                  // entertainment news
                  SizedBox(
                    height: 400,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewsdetailCard(
                                      author: homeproviderobj
                                          .articlelist[index].author
                                          .toString(),
                                      title: homeproviderobj
                                          .articlelist[index].title
                                          .toString(),
                                      description: homeproviderobj
                                          .articlelist[index].description
                                          .toString(),
                                      urlToImage: homeproviderobj
                                          .articlelist[index].urlToImage
                                          .toString(),
                                      publishedAt: homeproviderobj
                                          .articlelist[index].publishedAt,
                                      url: homeproviderobj.articlelist[index].url
                                          .toString(),
                                      source: homeproviderobj.articlelist[index].source)));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 200,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: NetworkImage(homeproviderobj
                                          .filteredArticles[index].urlToImage
                                          .toString()),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  homeproviderobj.filteredArticles[index].title
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  homeproviderobj
                                      .filteredArticles[index].publishedAt
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
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
                      itemCount: homeproviderobj.filteredArticles.length,
                    ),
                  ),
                  // sports news
                  SizedBox(
                    height: 400,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewsdetailCard(
                                      author: homeproviderobj
                                          .articlelist[index].author
                                          .toString(),
                                      title: homeproviderobj
                                          .articlelist[index].title
                                          .toString(),
                                      description: homeproviderobj
                                          .articlelist[index].description
                                          .toString(),
                                      urlToImage: homeproviderobj
                                          .articlelist[index].urlToImage
                                          .toString(),
                                      publishedAt: homeproviderobj
                                          .articlelist[index].publishedAt,
                                      url: homeproviderobj.articlelist[index].url
                                          .toString(),
                                      source: homeproviderobj.articlelist[index].source)));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 200,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: NetworkImage(homeproviderobj
                                          .filteredArticles[index].urlToImage
                                          .toString()),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  homeproviderobj.filteredArticles[index].title
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  homeproviderobj
                                      .filteredArticles[index].publishedAt
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
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
                      itemCount: homeproviderobj.filteredArticles.length,
                    ),
                  ),
                  // business news
                  SizedBox(
                    height: 400,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewsdetailCard(
                                      author: homeproviderobj
                                          .articlelist[index].author
                                          .toString(),
                                      title: homeproviderobj
                                          .articlelist[index].title
                                          .toString(),
                                      description: homeproviderobj
                                          .articlelist[index].description
                                          .toString(),
                                      urlToImage: homeproviderobj
                                          .articlelist[index].urlToImage
                                          .toString(),
                                      publishedAt: homeproviderobj
                                          .articlelist[index].publishedAt,
                                      url: homeproviderobj.articlelist[index].url
                                          .toString(),
                                      source: homeproviderobj.articlelist[index].source)));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 200,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: NetworkImage(homeproviderobj
                                          .filteredArticles[index].urlToImage
                                          .toString()),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  homeproviderobj.filteredArticles[index].title
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  homeproviderobj
                                      .filteredArticles[index].publishedAt
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
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
                      itemCount: homeproviderobj.filteredArticles.length,
                    ),
                  ),
                  // technology news
                  SizedBox(
                    height: 400,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewsdetailCard(
                                      author: homeproviderobj
                                          .articlelist[index].author
                                          .toString(),
                                      title: homeproviderobj
                                          .articlelist[index].title
                                          .toString(),
                                      description: homeproviderobj
                                          .articlelist[index].description
                                          .toString(),
                                      urlToImage: homeproviderobj
                                          .articlelist[index].urlToImage
                                          .toString(),
                                      publishedAt: homeproviderobj
                                          .articlelist[index].publishedAt,
                                      url: homeproviderobj.articlelist[index].url
                                          .toString(),
                                      source: homeproviderobj.articlelist[index].source)));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 200,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: NetworkImage(homeproviderobj
                                          .filteredArticles[index].urlToImage
                                          .toString()),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  homeproviderobj.filteredArticles[index].title
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  homeproviderobj
                                      .filteredArticles[index].publishedAt
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
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
                      itemCount: homeproviderobj.filteredArticles.length,
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  TabBar tabbar(BuildContext context) {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: Colors.white,
      labelStyle: TextStyle(fontSize: 12),
      unselectedLabelColor: Colors.blue,
      indicator: BoxDecoration(
        color: Colors.blue,
      ),
      isScrollable: true,
      tabs: Dummydb.categories.map((category) => Tab(text: category)).toList(),
      onTap: (index) {
        setState(() {
          currentCategory = Dummydb.categories[index];
          searchController.clear();
        });
        context
            .read<HomescreenController>()
            .getnewslist(Dummydb.categories[index]);
      },
    );
  }

  Container textfield() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          labelText: 'SEARCH',
          hintText: "SEARCH ANYTHING",
          suffixIcon: Icon(Icons.search),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue, width: 3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black, width: 3),
          ),
        ),
      ),
    );
  }

  AppBar appbar() {
    return AppBar(
      backgroundColor: Colors.blue,
      leading: Icon(
        Icons.menu,
        size: 40,
        color: Colors.white,
      ),
      title: Text("DAILY NEWS",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
      actions: [
        Icon(
          Icons.newspaper,
          size: 35,
          color: Colors.white,
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
