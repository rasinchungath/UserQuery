import '../models/user_model.dart';
import 'package:http/http.dart' as http;

class HelperServices {
  var client = http.Client();
  var uri = 'https://jsonplaceholder.typicode.com/users';

  Future<List<User>> getUserDetails() async {
    var url = Uri.parse(uri);
    var response = await client.get(url);
    try {
      if (response.statusCode == 200) {
        var json = response.body;
        print(response.body,);
        return userFromJson(json);
      }
    } catch (e) {
      print(e);
    }
    throw Exception('failed to load user list');
  }
}