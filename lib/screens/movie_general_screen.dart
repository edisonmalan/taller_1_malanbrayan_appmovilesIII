import 'package:flutter/material.dart';
import '../drawer/drawer.dart';

class MovieGeneralScreen extends StatelessWidget {
  const MovieGeneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas Generales'),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primaryContainer,
        foregroundColor: theme.colorScheme.onPrimaryContainer,
      ),
      drawer: const AppDrawer(),
      backgroundColor: theme.colorScheme.surface,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        children: [
          _buildMovieCard(
            context: context,
            title: 'Trailer1',
            imageUrl:
                'https://icwkkknphaxzwykiwyqt.supabase.co/storage/v1/object/public/images/TRAILER1.jpg',
            description: 'Descripción breve de Trailer 1.',
            routeName: '/movie_detail1',
          ),
          _buildMovieCard(
            context: context,
            title: 'Trailer2',
            imageUrl:
                'https://icwkkknphaxzwykiwyqt.supabase.co/storage/v1/object/public/images/TRAILER2.jpg',
            description: 'Descripción breve de Trailer 2.',
            routeName: '/movie_detail2',
          ),
          _buildMovieCard(
            context: context,
            title: 'Trailer3',
            imageUrl:
                'https://icwkkknphaxzwykiwyqt.supabase.co/storage/v1/object/public/images/TRAILER3.jpg',
            description: 'Descripción breve de Trailer 3.',
            routeName: '/movie_detail3',
          ),
        ],
      ),
    );
  }

  Widget _buildMovieCard({
    required BuildContext context,
    required String title,
    required String imageUrl,
    required String description,
    required String routeName,
  }) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      color: theme.colorScheme.surface,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => Navigator.pushNamed(context, routeName),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  width: 90,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (ctx, error, stackTrace) => Container(
                    width: 90,
                    height: 120,
                    color: theme.colorScheme.surfaceContainerHighest,
                    child: Icon(
                      Icons.broken_image,
                      color: theme.colorScheme.onSurfaceVariant,
                      size: 48,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
