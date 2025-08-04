import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/movie_service.dart';

class MovieProvider extends ChangeNotifier {
  final _service = MovieService();

  List<Movie> topRated = [];
  List<Movie> nowPlaying = [];
  List<Movie> searchResults = [];

  void loadTopRated() async {
    topRated = await _service.getTopRated();
    notifyListeners();
  }

  void loadNowPlaying() async {
    nowPlaying = await _service.getNowPlaying();
    notifyListeners();
  }

  void searchMovie(String query) async {
    searchResults = await _service.searchMovie(query);
    notifyListeners();
  }
}