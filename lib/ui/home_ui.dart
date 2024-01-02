import 'package:flutter/material.dart';
import 'package:malhas_geograficas_br/components/custom_dropdown_button.dart';
import 'package:malhas_geograficas_br/models/intra_region.dart';
import 'package:malhas_geograficas_br/models/mesh.dart';
import 'package:malhas_geograficas_br/repositories/meshe_repository.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  static String title = "Malhas Geográficas do Brasil";

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  final meshes = MesheRepository.meshes;

  // Valores
  List<IntraRegion>? intraRegionOptions;
  Mesh? meshType;
  String? meshTypeSelected;
  String? intraRegionSelected;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          HomeUI.title,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomDropdownButton<Mesh?>(
              label: 'Malha geográfica',
              hint: 'Selecione o tipo de malha geográfica',
              items: meshes.map((Mesh mesh) {
                return DropdownMenuItem<Mesh>(
                  value: mesh,
                  child: Text(mesh.type),
                );
              }).toList(),
              onChanged: (Mesh? mesh) {
                setState(() {
                  meshTypeSelected = mesh!.path;
                  meshType = mesh;
                  intraRegionOptions = mesh.intraRegionOptions;
                });

                debugPrint(meshTypeSelected);
                debugPrint(intraRegionOptions.toString());
              },
              value: meshType,
            ),
            CustomDropdownButton<String?>(
              label: 'Intrarregião',
              hint: 'Selecione a intrarregião',
              items: intraRegionOptions?.map((IntraRegion intraRegion) {
                    return DropdownMenuItem<String>(
                      value: intraRegion.path,
                      child: Text(intraRegion.type),
                    );
                  }).toList() ??
                  [],
              onChanged: (String? intraRegion) {
                setState(() {
                  intraRegionSelected = intraRegion;
                });

                debugPrint(intraRegionSelected);
              },
              value: intraRegionSelected,
            )
          ],
        ),
      ),
    );
  }
}
