import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/homescreen_model.dart';

class HomescreenController with ChangeNotifier {
  List<Article> articlelist = [];
  List<Article> filteredArticles = [];
  bool isloading = false;

  Future<void> getnewslist(String category) async {
    isloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$category&apiKey=59128a33730c456b8fd15181999cec37");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        //  log(response.body);
        Homescreenmodel resobj = catFactmodelFromJson(response.body);
        articlelist = resobj.articles ?? [];
        filteredArticles = articlelist; // Initially, show all articles
      }
    } catch (e) {
      print(e);
    }
    isloading = false;
    notifyListeners();
  }

  void searchArticles(String searchname) {
    if (searchname.isEmpty) {
      filteredArticles = articlelist; // Show all articles if search is empty
    } else {
      filteredArticles = articlelist
          .where((article) =>
              (article.title?.toLowerCase() ?? '')
                  .contains(searchname.toLowerCase()) ||
              (article.description?.toLowerCase() ?? '')
                  .contains(searchname.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
