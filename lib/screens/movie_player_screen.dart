import 'package:flutter/material.dart';
import '../drawer/drawer.dart';

class MoviePlayerScreen extends StatelessWidget {
  const MoviePlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String>? movie =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>?;

    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(movie?['title'] ?? 'Reproductor'),
        
        backgroundColor: theme.colorScheme.primaryContainer,
        foregroundColor: theme.colorScheme.onPrimaryContainer,
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      backgroundColor: theme.colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.movie, size: 100, color: Colors.black),
            const SizedBox(height: 20),
            Text(
              'Aquí se reproducirá la película:\n${movie?['title'] ?? 'Desconocida'}',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(color: Colors.black),
            ),
            const SizedBox(height: 40),
            Wrap(
              spacing: 20,
              children: [
                IconButton(
                  icon: const Icon(Icons.play_arrow),
                  iconSize: 36,
                  color: Colors.black,
                  onPressed: () {
                    // Lógica de reproducción
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.pause),
                  iconSize: 36,
                  color: Colors.black,
                  onPressed: () {
                    // Lógica de pausa
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.fast_rewind),
                  iconSize: 36,
                  color: Colors.black,
                  onPressed: () {
                    // Retroceder
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.fast_forward),
                  iconSize: 36,
                  color: Colors.black,
                  onPressed: () {
                    // Adelantar
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.volume_up),
                  iconSize: 36,
                  color: Colors.black,
                  onPressed: () {
                    // Control de volumen
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
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
