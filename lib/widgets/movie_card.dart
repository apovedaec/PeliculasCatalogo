import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../models/movie.dart';
import '../screens/movie_detail_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (_) => MovieDetailScreen(movie: movie),
        ));
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        elevation: 4,
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: movie.posterUrl,
              width: 100,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.title,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    RatingBarIndicator(
                      rating: movie.voteAverage! / 2,
                      itemCount: 5,
                      itemSize: 18,
                      itemBuilder: (context, _) =>
                          Icon(Icons.star, color: Colors.amber),
                    ),
                    SizedBox(height: 4),
                    Text("Estreno: ${movie.releaseDate}",
                        style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}