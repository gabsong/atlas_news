import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:atlas_news/src/models/article.dart';


class ArticleList extends StatelessWidget {
  final List<Article> articles;

  const ArticleList({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) {
        final article = articles[index];
        return ListTile(
          title: Text(article.headline),
          leading: Image.network(
            article.thumbnail,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          onTap: () async {
            final Uri url = Uri.parse(article.sourceUrl);
            await launchUrl(url);
          }
        );
      }
    );
  }
}
