import 'package:flutter/material.dart';
import '../drawer/drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, String>> movies = [
    {
      'title': 'WONDER WOMAN 1984',
      'image': 'https://th.bing.com/th/id/OIP.pm4WNnDjnSQpp_ZxAp5UowHaKE?r=0&rs=1&pid=ImgDetMain/150',
      'description': 'Descripción breve de la película 1.',
      'category': 'Populares',
      'route': '/movie_detail1',
    },
    {
      'title': 'SONIC 3 LA PELICULA',
      'image': 'https://th.bing.com/th/id/OIP.Fyt50kBonZzL4CO8yX3vLgHaK-?r=0&rs=1&pid=ImgDetMain/150',
      'description': 'Descripción breve de la película 2.',
      'category': 'Tendencias',
      'route': '/movie_detail2',
    },
    {
      'title': 'JURASSIC WORLD - RENACIDO',
      'image': 'https://www.filmofilia.com/wp-content/uploads/2024/12/Jurassic-World-Rebirth-Poster.jpg/150',
      'description': 'Descripción breve de la película 3.',
      'category': 'Nuevas Llegadas',
      'route': '/movie_detail3',
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
        backgroundColor: theme.colorScheme.surface,
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
              final route = movie['route'];
              if (route != null) {
                Navigator.pushNamed(context, route);
              }
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
