import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/movie.dart';
class MovieDetailHeader extends StatelessWidget {
  final Movie movie;
  const MovieDetailHeader({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(movie.title),
        background: CachedNetworkImage(
          imageUrl: movie.backdropUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}