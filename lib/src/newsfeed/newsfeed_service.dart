import 'package:atlas_news/src/models/article.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class NewsfeedService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Article>> getArticles() async {
    final QuerySnapshot querySnapshot = await _db
      .collection('articles')
      .get();
    final List<Article> loadedArticles = [];

    for (var doc in querySnapshot.docs) {
      final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      loadedArticles.add(Article(
        headline: data['headline'],
        sourceUrl: data['sourceUrl'],
        thumbnail: data['thumbnail'],
      ));
    }

    return loadedArticles;
  }
}
