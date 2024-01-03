import 'package:flutter/material.dart';
import 'package:malhas_geograficas_br/ui/home_ui.dart';
import 'package:malhas_geograficas_br/utils/utils.dart';

class GeographicMeshesOfBrazil extends StatelessWidget {
  const GeographicMeshesOfBrazil({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      title: 'Malhas Geográficas do Brasil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeUI(),
    );
  }
}
