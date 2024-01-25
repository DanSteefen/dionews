import 'package:dionews/components/customerListTitle.dart';
import 'package:dionews/model/artical_model.dart';
import 'package:dionews/service/api_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiService client = ApiService();

    return MaterialApp( // Add MaterialApp as the root widget
      home: Scaffold(
        appBar: AppBar(
          title: Text("News App", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
        ),
        body: FutureBuilder(
          future: client.getArticle(),
          builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              List<Article>? articles = snapshot.data;

              return ListView.builder(
                itemCount: articles?.length,
                itemBuilder: (context, index) =>
                    customerListTitle(articles![index], context),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}