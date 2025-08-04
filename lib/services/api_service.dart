import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../models/movie.dart';
class ApiService {
  static final String? _apiKey = dotenv.env['TMDB_API_KEY'];
  static const String _baseUrl = 'https://api.themoviedb.org/3';
  Future<List<Movie>> getNowPlayingMovies() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/movie/now_playing?language=es-EC&api_key=$_apiKey'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load now playing movies');
    }
  }
  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/movie/top_rated?language=es-EC&api_key=$_apiKey'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load top rated movies');
    }
  }
  Future<List<Movie>> searchMovies(String query) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/search/movie?language=es-EC&api_key=$_apiKey&query=$query'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to search movies');
    }
  }
  Future<Movie> getMovieDetails(int movieId) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/movie/$movieId?language=es-EC&api_key=$_apiKey'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Movie.fromJson(data);
    } else {
      throw Exception('Failed to load movie details');
    }
  }
}