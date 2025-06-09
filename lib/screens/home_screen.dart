import 'package:flutter/material.dart';
import '../drawer/drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, String>> movies = [
    {
      'title': 'Película 1',
      'image': 'https://via.placeholder.com/150',
      'description': 'Descripción breve de la película 1.',
      'category': 'Populares',
    },
    {
      'title': 'Película 2',
      'image': 'https://via.placeholder.com/150',
      'description': 'Descripción breve de la película 2.',
      'category': 'Tendencias',
    },
    {
      'title': 'Película 3',
      'image': 'https://via.placeholder.com/150',
      'description': 'Descripción breve de la película 3.',
      'category': 'Nuevas Llegadas',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Catálogo de Películas'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: theme.colorScheme.primaryContainer,
          foregroundColor: theme.colorScheme.onPrimaryContainer,
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Todas'),
              Tab(text: 'Populares'),
              Tab(text: 'Tendencias'),
              Tab(text: 'Nuevas Llegadas'),
            ],
          ),
        ),
        drawer: const AppDrawer(),
        backgroundColor: theme.colorScheme.onSurface,
        body: TabBarView(
          children: [
            buildMovieList(context, movies),
            buildMovieList(context, filterByCategory('Populares')),
            buildMovieList(context, filterByCategory('Tendencias')),
            buildMovieList(context, filterByCategory('Nuevas Llegadas')),
          ],
        ),
      ),
    );
  }

  List<Map<String, String>> filterByCategory(String category) {
    return movies.where((movie) => movie['category'] == category).toList();
  }

  Widget buildMovieList(BuildContext context, List<Map<String, String>> list) {
    final theme = Theme.of(context);
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final movie = list[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          color: theme.colorScheme.surface,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Navigator.pushNamed(context, '/movie_detail', arguments: movie);
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      movie['image']!,
                      width: 90,
                      height: 120,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 90,
                          height: 120,
                          color: theme.colorScheme.surfaceContainerHighest,
                          child: Icon(
                            Icons.broken_image,
                            color: theme.colorScheme.onSurfaceVariant,
                            size: 48,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie['title']!,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          movie['description']!,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
