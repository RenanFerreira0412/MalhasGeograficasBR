import 'package:flutter/material.dart';
import 'package:malhas_geograficas_br/geographic_meshes_brazil.dart';
import 'package:malhas_geograficas_br/providers/data_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => DataProvider())],
    child: const GeographicMeshesOfBrazil(),
  ));
}
