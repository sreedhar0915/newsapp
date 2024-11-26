import 'package:flutter/material.dart';
import 'package:newsapp/model/homescreen_model.dart';

// ignore: must_be_immutable
class CustomNewsCard extends StatelessWidget {
  void Function()? oncardTap;
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  CustomNewsCard({
    super.key,
    required this.author,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
    required this.url,
    required this.source,
    this.oncardTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: oncardTap,
      child: Expanded(
        child: Container(
          width: double.infinity,
          child: Column(children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage("$urlToImage")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                ),
                                Text(
                                  "$publishedAt",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.bookmark_border_outlined),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "$source",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "$title",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Icon(Icons.more_horiz)
              ],
            ),
            SizedBox(height: 8),
            Text(
              "$description",
              maxLines: 4,
            ),
            SizedBox(width: 8),
            Text("$author")
          ]),
        ),
      ),
    );
  }
}
