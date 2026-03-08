import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp/Models/Movie_Model.dart';
import 'package:movieapp/View_Model/View_Model.dart';

class ApiService {

  /// Fetch popular movies
  static Future<void> sendRequest(int page) async {

    try {

      final String apiKey = dotenv.env["API_KEY"]!;
      final String baseUrl = dotenv.env["BASE_URL"]!;

      final String endPoint = "$baseUrl?language=en-US&page=$page";

      final Map<String, String> headers = {
        "Authorization": "Bearer $apiKey",
        "accept": "application/json"
      };

      final Uri uri = Uri.parse(endPoint);

      final response = await http.get(uri, headers: headers);

      print("STATUS CODE: ${response.statusCode}");

      if (response.statusCode == 200) {

        final Map<String, dynamic> mapResponse = jsonDecode(response.body);

        final List results = mapResponse["results"];

        final List<MovieModel> models = results.map((movie) {
          return MovieModel.fromMap(movie);
        }).toList();

        /// Add movies to ViewModel list
        vm.movies.value = [...vm.movies.value, ...models];

        /// Increase page
        vm.currentPage += 1;

        print("Movies Loaded: ${models.length}");

      } else {

        print("API ERROR: ${response.statusCode}");
        print(response.body);

      }

    } catch (e) {

      print("Error while sending API request: $e");

    }
  }


  /// Fetch movie genres
  static Future<void> fetchMovieGenres() async {

    try {

      final String apiKey = dotenv.env["API_KEY"]!;
      final String genreUrl = dotenv.env["GENRE_URL"]!;

      final Map<String, String> headers = {
        "Authorization": "Bearer $apiKey",
        "accept": "application/json"
      };

      final Uri uri = Uri.parse(genreUrl);

      final response = await http.get(uri, headers: headers);

      print("GENRES STATUS: ${response.statusCode}");

      if (response.statusCode == 200) {

        final Map<String, dynamic> responseMap = jsonDecode(response.body);

        final List genresList = responseMap["genres"];

        Map<int, String> result = {};

        for (var genre in genresList) {
          result[genre["id"]] = genre["name"];
        }

        vm.genreMap = result;

        print("Genres Loaded: ${result.length}");

      } else {

        print("GENRES ERROR: ${response.statusCode}");
        print(response.body);

      }

    } catch (e) {

      print("Error while fetching genres: $e");

    }
  }

}