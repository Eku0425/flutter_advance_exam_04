import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiHelper {
  Future<Map> fetchNewsData() async {
    Uri url = Uri.parse(
        'https://newsapi.org/v2/top-headlines/sources?apiKey=d6dd1ff3c7f5413798f12a961f4cb84e');
    Response response = await http.get(url);

    if (response.statusCode == 200) {
      final json = response.body;
      final Map data = jsonDecode(json);
      return data;
    } else {
      return {};
    }
  }
}

//d6dd1ff3c7f5413798f12a961f4cb84e
//https://newsapi.org/v2/top-headlines/sources?apiKey=d6dd1ff3c7f5413798f12a961f4cb84e
