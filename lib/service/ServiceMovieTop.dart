import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/model/MovieTopRateModel.dart';

class ProdukApiTopDB {
  static var client = http.Client();

  static Future<MovieToprateModel> getdata(page) async {
    print(page);
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4Y2VkNTc5NWNiOWRkNGFjYWFjOTUxMGQ2YjY4ZmVlNyIsInN1YiI6IjYyYTgwNzA2M2UyZWM4MDA1MDU2ZDk4YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.5llgAWQikiiP-q6yGmlfTFZCSdOC8dZIQoZ-JSC71es'
    };
    var response = await client.get(
        Uri.parse('https://api.themoviedb.org/3/movie/top_rated?page=${page}'),
        headers: requestHeaders);
    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);

      return MovieToprateModel.fromJson(jsonString);
    } else {
      var jsonString = jsonDecode(response.body);

      return MovieToprateModel.fromJson(jsonString);
    }
  }
}
