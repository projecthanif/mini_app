import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mini_app/models/user_model.dart';

class UserService {
  final String url = "https://jsonplaceholder.org/users";

  Future<List<UserModel>> getUsers() async {
    final Uri uri = Uri.parse(url);

    try {
      final http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> decodedBody = jsonDecode(response.body);
        return decodedBody.map((e) => UserModel.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      throw Exception("error: $e");
    }
  }

  Future<UserModel?> getUserById(int id) async {
    final Uri uri = Uri.parse(url);

    final http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> decodedResponse = jsonDecode(response.body);

      final queryedResponse = decodedResponse.firstWhere((e) {
        return e['id'] == id;
      });

      return UserModel(
        id: id,
        firstname: queryedResponse['firstname'],
        lastname: queryedResponse['lastname'],
        email: queryedResponse['email'],
        birthDate: queryedResponse['birthDate'],
        phone: queryedResponse['phone'],
      );
    }

    return null;
  }
}
