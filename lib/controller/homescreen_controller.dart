import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/homescreen_model.dart';

class HomescreenController with ChangeNotifier {
  List<Article> articlelist = [];
  bool isloading = false;
  Future<void> getnewslist() async {
    isloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=keyword&apiKey=59128a33730c456b8fd15181999cec37");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        log(response.body);
        Homescreenmodel resobj = catFactmodelFromJson(response.body);
        articlelist = resobj.articles ?? [];
      }
    } catch (e) {
      print(e);
    }
    isloading = false;
    notifyListeners();
  }
}

































//         Factmodel resobj = factmodelFromJson(response.body);
  //      Factlist = resobj.Factlist ?? [];
   //     log(Factlist.length.toString());