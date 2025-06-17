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
    try {
      posts = await _postService.getAllPost();
    } catch (e) {
      print("Error: $e");
      posts = [];
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> getPostQueried(String query, bool filtered) async {
    try {
      loading = true;
      queriedPosts = await _postService.getPostBySearch(query, filtered);
    } catch (e) {
      print("Error: $e");
      queriedPosts = [];
    } finally {
      notifyListeners();
      loading = false;
    }
  }

  Future<void> getUserById(int id) async {
    try {
      loading = true;
      post = await _postService.getUserById(id);
    } catch (e) {
      print("Error: $e");
      post = null;
    } finally {
      notifyListeners();
      loading = false;
    }
  }
}
