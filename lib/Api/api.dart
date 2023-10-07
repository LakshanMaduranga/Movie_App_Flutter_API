import 'package:movie_app/Constants/constants.dart';
import 'package:movie_app/Model/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as Json;

class Api {
  static const _trendingURL =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}";

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingURL));
    if (response.statusCode == 200) {
      final decodedData = Json.jsonDecode(response.body)["results"] as List;
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load data");
    }

    return [];
  }

  static const _topRatedURL =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}";

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedURL));
    if (response.statusCode == 200) {
      final decodedData = Json.jsonDecode(response.body)["results"] as List;
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load data");
    }

    return [];
  }

  static const _upcomingdURL =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}";

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(_upcomingdURL));
    if (response.statusCode == 200) {
      final decodedData = Json.jsonDecode(response.body)["results"] as List;
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load data");
    }
  }
}
