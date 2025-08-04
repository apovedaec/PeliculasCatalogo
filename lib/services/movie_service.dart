import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/movie.dart';

class MovieService {
  final String _baseUrl = 'https://api.themoviedb.org/3';
  final String _apiKey = dotenv.env['TMDB_API_KEY'] ?? '';
  Future<List<Movie>> getTopRated() async {
    final url = Uri.parse('$_baseUrl/movie/top_rated?language=es-EC&api_key=$_apiKey&language=es-ES');
    final res = await http.get(url);
    final data = json.decode(res.body);
    return (data['results'] as List).map((json) => Movie.fromJson(json)).toList();
  }

  Future<List<Movie>> getNowPlaying() async {
    final url = Uri.parse('$_baseUrl/movie/now_playing?language=es-EC&api_key=$_apiKey&language=es-ES');
    final res = await http.get(url);
    final data = json.decode(res.body);
    return (data['results'] as List).map((json) => Movie.fromJson(json)).toList();
  }

  Future<List<Movie>> searchMovie(String query) async {
    final url = Uri.parse('$_baseUrl/search/movie?language=es-EC&api_key=$_apiKey&language=es-ES&query=$query');
    final res = await http.get(url);
    final data = json.decode(res.body);
    return (data['results'] as List).map((json) => Movie.fromJson(json)).toList();
  }
}