import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mini_app/models/photo_model.dart';

class PhotoService {
  Future<List<PhotoModel>?> getAllPhoto() async {
    Uri url = Uri.parse(
        "https://api.unsplash.com/photos?client_id=u8ycG1KzNZ5qoPCOQJUXQtX1hSglAQkDy8rk6tFscb8");

    final http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> decodedRes = jsonDecode(response.body);
      return decodedRes.map((e) => PhotoModel.fromJson(e)).toList();
    }

    return null;
  }
}
