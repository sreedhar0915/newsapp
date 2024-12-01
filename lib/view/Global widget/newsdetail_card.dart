import 'package:flutter/material.dart';
import 'package:newsapp/model/homescreen_model.dart';
import 'package:share_plus/share_plus.dart';

class NewsdetailCard extends StatelessWidget {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  NewsdetailCard({
    super.key,
    required this.author,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
    required this.url,
    required this.source,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Display Image
            Imagecontainer(),

            publisheddate(),
            SizedBox(
              height: 10,
            ),

            Titlesection(),
            SizedBox(height: 10),
            Link(),
            Description(),
            SizedBox(
              height: 20,
            ),
            profilenamesection(),

            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Padding profilenamesection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue,
            child: Icon(Icons.person),
            // backgroundImage: NetworkImage(""),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "$author",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {},
            child: Container(
              height: 30,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Follow",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding Description() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        "$description",
        style: TextStyle(
          fontSize: 16,
          color: Colors.black, // Adjust line height for better readability
        ),
      ),
    );
  }

  Row Link() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "$url",
            style: TextStyle(
              fontSize: 8,
              color: Colors.blue,
              fontWeight: FontWeight.w800,
              height: 1.5,
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }

  Row Titlesection() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "$title",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.w800,
              height: 1.5,
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }

  Padding publisheddate() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "$publishedAt",
            style: TextStyle(
              fontSize: 12,
              color: Colors.black87,
              fontWeight: FontWeight.w200,
            ),
          )
        ],
      ),
    );
  }

  Padding Imagecontainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage("$urlToImage"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  AppBar Appbar() {
    return AppBar(
      toolbarHeight: 100,
      title: Text(
        "News Details",
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFFD4BEE4).withOpacity(0.2),
            ),
            child: IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.blue,
                size: 20,
              ),
              onPressed: () {
                // Add share
                Share.share('Check out this news content! $url');
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFFD4BEE4).withOpacity(0.2),
            ),
            child: IconButton(
              icon: Icon(
                Icons.bookmark_outline,
                color: Colors.blue,
                size: 20,
              ),
              onPressed: () {
                // Add bookmark
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 20),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFFD4BEE4).withOpacity(0.2),
            ),
            child: IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Color(0xFFD9B7EBD),
                size: 20,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
