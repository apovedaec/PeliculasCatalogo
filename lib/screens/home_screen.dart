import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import '../widgets/movie_card.dart';
import '../widgets/search_bar.dart' as custom_widgets;

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    final provider = Provider.of<MovieProvider>(context, listen: false);
    provider.loadTopRated();
    provider.loadNowPlaying();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Catálogo de Películas'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.star), text: 'Mejores críticas'),
            Tab(icon: Icon(Icons.new_releases), text: 'Estrenos'),
            Tab(icon: Icon(Icons.search), text: 'Buscar'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildMovieList(provider.topRated),
          buildMovieList(provider.nowPlaying),
          buildSearchTab(provider),
        ],
      ),
    );
  }

  Widget buildMovieList(List movies) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (_, index) => MovieCard(movie: movies[index]),
    );
  }

  Widget buildSearchTab(MovieProvider provider) {
    return Column(
      children: [
        custom_widgets.SearchBar(onSearch: provider.searchMovie),
        Expanded(child: buildMovieList(provider.searchResults)),
      ],
    );
  }
}