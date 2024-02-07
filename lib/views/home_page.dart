import 'package:flutter/material.dart';
import 'package:news_api_provider/const/consts.dart';
import 'package:news_api_provider/provider/news_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProviderOperation>(context, listen: false).getAllPosts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NEWS'),
      ),
      body: Consumer<ProviderOperation>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final posts = value.posts;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.network(
                    posts[index].urlToImage ?? placeholder,
                    width: 100,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                  title: Text(posts[index].title ?? ''),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
