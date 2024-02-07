import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_api_provider/models/post_model.dart';

class ProviderService {
  getAll() async {
    const url =
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=39ee7b22c9704aab976582a56e9082b9';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final List<Article> posts = (json['articles'] as List)
          .map((e) => Article(
                title: e['title'],
                description: e['description'],
                url: e['url'],
                urlToImage: e['urlToImage'],
              ))
          .toList();
      return posts;
    } else {
      return [];
    }
  }
}
