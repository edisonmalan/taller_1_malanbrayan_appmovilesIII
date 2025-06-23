import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../drawer/drawer.dart';

class MovieDetailScreen2 extends StatelessWidget {
  const MovieDetailScreen2({super.key});

  final String videoUrl = 'https://icwkkknphaxzwykiwyqt.supabase.co/storage/v1/object/public/videos/TRAILER%202.mp4';

  Future<void> _launchURL(BuildContext context) async {
    final Uri uri = Uri.parse(videoUrl);
    try {
      bool launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!launched) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se pudo abrir el enlace')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al abrir el enlace')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trailer 2'),
        backgroundColor: theme.colorScheme.primaryContainer,
        foregroundColor: theme.colorScheme.onPrimaryContainer,
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(
              'https://th.bing.com/th/id/OIP.Fyt50kBonZzL4CO8yX3vLgHaK-?r=0&rs=1&pid=ImgDetMain',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            const Text('SONIC 3 LA PELICULA'),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _launchURL(context),
                child: const Text('Reproducir'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
