import 'package:http/http.dart' as http;
import '../model/model.dart';

class Webservice {
  Future fetchCountries() async {
    String url =
        "https://raw.githubusercontent.com/Muhaiminur/muhaiminur.github.io/master/misfitflutter.tech";

    final response = await http.get(url);
    if (response.statusCode == 200) {
      return blogPostFromJson(response.body);
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
