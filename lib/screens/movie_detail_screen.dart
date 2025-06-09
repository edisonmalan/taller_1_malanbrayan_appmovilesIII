import 'package:flutter/material.dart';
import '../drawer/drawer.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String>? movie =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>?;

    final theme = Theme.of(context);

    if (movie == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Detalle de Película'),
          backgroundColor: theme.colorScheme.primaryContainer,
          foregroundColor: theme.colorScheme.onPrimaryContainer,
          
          centerTitle: true,
        ),
        drawer: const AppDrawer(),
        body: const Center(child: Text('No se encontró información de la película')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(movie['title']!),
         
        backgroundColor: theme.colorScheme.primaryContainer,
        foregroundColor: theme.colorScheme.onPrimaryContainer,
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      backgroundColor: theme.colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                movie['image']!,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  color: theme.colorScheme.surfaceContainerHighest,
                  child: Icon(
                    Icons.broken_image,
                    color: theme.colorScheme.onSurfaceVariant,
                    size: 64,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              movie['description']!,
              style: theme.textTheme.bodyLarge?.copyWith(color: Colors.black),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/movie_player', arguments: movie);
                },
                child: const Text('Reproducir'),
              ),
              
            ),
            const SizedBox(height: 12),

          
            OutlinedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Regresar'),
            ),
          ],
        ),
      ),
    );
  }
}
