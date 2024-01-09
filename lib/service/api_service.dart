import 'dart:convert';

import 'package:dionews/model/artical_model.dart';
import 'package:http/http.dart';

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=d7d2e13a0a9148e59d50a0b2de0deb11";

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl as Uri);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
