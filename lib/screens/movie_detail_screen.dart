import 'package:flutter/material.dart';
import '../models/movie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CachedNetworkImage(imageUrl: movie.posterUrl, height: 300),
            SizedBox(height: 12),
            RatingBarIndicator(
              rating: movie.voteAverage! / 2,
              itemCount: 5,
              itemSize: 24,
              itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
            ),
            SizedBox(height: 8),
            Text("Estreno: ${movie.releaseDate}",
                style: TextStyle(color: Colors.grey[600])),
            SizedBox(height: 16),
            Text(movie.overview ?? '',
                style: TextStyle(fontSize: 16), textAlign: TextAlign.justify),
          ],
        ),
      ),
    );
  }
}