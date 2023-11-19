import 'package:flutter/material.dart';
import 'package:atlas_news/src/models/article.dart';
import 'package:atlas_news/src/widgets/article_list.dart';
import 'package:atlas_news/src/newsfeed/newsfeed_service.dart';


class Newsfeed extends StatefulWidget {
  const Newsfeed({super.key, required this.title});

  final String title;

  @override
  State<Newsfeed> createState() => _NewsfeedState();
}

class _NewsfeedState extends State<Newsfeed> {
  final NewsfeedService _newsfeedService = NewsfeedService();

  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    _loadArticles();
  }

  Future<void> _loadArticles() async {
    final loadedArticles = await _newsfeedService.getArticles();

    setState(() {
      articles = loadedArticles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ArticleList(articles: articles)
    );
  }
}
