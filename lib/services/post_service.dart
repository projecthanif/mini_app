import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mini_app/models/post_model.dart';

class PostService {
  final String url = "https://jsonplaceholder.org/posts";

  Future<List<PostModel>> getAllPost() async {
    final Uri uri = Uri.parse(url);

    final http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> decodedResponse = jsonDecode(response.body);
      return decodedResponse.map((e) => PostModel.fromJson(e)).toList();
    }
    return [];
  }

  Future<List<PostModel>>? getPostBySearch(String value, bool filtered) async {
    final List<PostModel> posts = await getAllPost();
    final String query = value.toLowerCase();

    if (!filtered) {
      return posts.where((post) {
        final title = post.title.toLowerCase();
        final slug = post.slug.toLowerCase();
        return title.contains(query) || slug.contains(query);
      }).toList();
    }

    if (value == "1") {
      posts.sort(
        (a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()),
      );
    } else {
      posts.sort(
        (a, b) => b.title.toLowerCase().compareTo(a.title.toLowerCase()),
      );
    }

    return posts;
  }

  Future<PostModel?> getUserById(int id) async {
    final Uri uri = Uri.parse(url);

    final http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> decodedResponse = jsonDecode(response.body);
      final dynamic res = decodedResponse.firstWhere((e) => e['id'] == id);
      return PostModel.fromJson(res);
    }
    return null;
  }
}
