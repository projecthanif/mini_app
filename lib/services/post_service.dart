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
