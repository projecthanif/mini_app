import 'package:flutter/material.dart';
import 'package:mini_app/models/post_model.dart';
import 'package:mini_app/services/post_service.dart';

class PostProvider extends ChangeNotifier {
  late List<PostModel> posts = [];
  late List<PostModel>? queriedPosts = null;
  late PostModel? post = null;
  bool loading = true;
  final PostService _postService = PostService();

  Future<void> getPost() async {
    posts = await _postService.getAllPost();
    loading = false;
    notifyListeners();
  }

  Future<void> getPostQueried(String query) async {
    loading = true;
    queriedPosts = await _postService.getPostBySearch(query);
    notifyListeners();
    loading = false;
  }

  Future<void> getUserById(int id) async {
    loading = true;
    post = await _postService.getUserById(id);
    notifyListeners();
    loading = false;
  }
}
