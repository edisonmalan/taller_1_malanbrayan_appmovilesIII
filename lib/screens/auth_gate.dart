import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  void initState() {
    super.initState();

    Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;
      final Session? session = data.session;

      // Solución: validar que el widget siga montado antes de usar context
      if (!mounted) return;

      if (event == AuthChangeEvent.signedIn && session != null) {
        Navigator.pushReplacementNamed(context, '/home');
      } else if (event == AuthChangeEvent.signedOut) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final session = Supabase.instance.client.auth.currentSession;

    if (session != null) {
      return HomeScreen(); // 🔄 Eliminamos const porque no puede ser const
    } else {
      return LoginScreen(); // 🔄 Igual aquí
    }
  }
}
