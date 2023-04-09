import '../models/user_model.dart';
import 'package:http/http.dart' as http;

class HelperServices {
  var client = http.Client();
  var uri = 'https://jsonplaceholder.typicode.com/users';

  Future<List<User>> getUserDetails() async {
    var url = Uri.parse(uri);
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var json = response.body;
        return userFromJson(json);
      }
    } catch (e) {
      print(e);
    }
    throw ('Failed to load users list');
  }
}
