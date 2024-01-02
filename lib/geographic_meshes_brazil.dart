import 'package:flutter/material.dart';
import 'package:malhas_geograficas_br/ui/home_ui.dart';

class GeographicMeshesOfBrazil extends StatelessWidget {
  const GeographicMeshesOfBrazil({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Malhas Geográficas do Brasil',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeUI(),
    );
  }
}
