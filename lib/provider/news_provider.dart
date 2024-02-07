import 'package:flutter/material.dart';
import 'package:news_api_provider/models/post_model.dart';
import 'package:news_api_provider/service/service_provider.dart';

class ProviderOperation extends ChangeNotifier {
  final service = ProviderService();
  bool isLoading = false;
  List<Article> _posts = [];
  List<Article> get posts => _posts;
  getAllPosts() async {
    isLoading = true;
    notifyListeners();
    final res = await service.getAll();
    _posts = res;
    isLoading = false;
    notifyListeners();
  }
}
