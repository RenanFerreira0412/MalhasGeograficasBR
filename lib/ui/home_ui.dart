import 'package:flutter/material.dart';
import 'package:malhas_geograficas_br/components/custom_dropdown_button.dart';
import 'package:malhas_geograficas_br/enum/meshe_type.dart';
import 'package:malhas_geograficas_br/models/intra_region.dart';
import 'package:malhas_geograficas_br/models/mesh.dart';

import 'package:malhas_geograficas_br/providers/data_provider.dart';
import 'package:malhas_geograficas_br/repositories/meshe_repository.dart';

import 'package:malhas_geograficas_br/responsive/responsive.dart';
import 'package:malhas_geograficas_br/utils/utils.dart';
import 'package:provider/provider.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  static String title = "Malhas Geográficas do Brasil";

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  final meshes = MesheRepository.meshes;
  late DataProvider dataProvider;

  final _formKey = GlobalKey<FormState>();

  // Valores
  List<IntraRegion>? intraRegionOptions;
  Mesh? meshType;
  String? intraRegionSelected;
  String? state;
  String? city;
  String? mesoregion;
  String? microregion;
  String? region;
  String? immediateRegion;
  String? intermediateRegion;
  String? country;

  @override
  void initState() {
    super.initState();
  }

  enableDropdownsByMeshType() {
    switch (MesheType.fromString(meshType!.type)) {
      case MesheType.byCountry:
        dataProvider.getCountries();
        break;
      case MesheType.byRegionOfBrazil:
        dataProvider.getRegions();
        break;
      default:
    }
  }

  enableDropdownsByState(String? value) {
    switch (MesheType.fromString(meshType!.type)) {
      case MesheType.byMesoregion:
        dataProvider.getMesoregions(value!);
        break;
      case MesheType.byMicroregion:
        dataProvider.getMicroregions(value!);
        break;
      case MesheType.byMunicipality:
        dataProvider.getCities(value!);
        break;
      case MesheType.byImmediateRegion:
        dataProvider.getImmediateRegions(value!);
        break;
      case MesheType.byIntermediateRegion:
        dataProvider.getIntermediateRegions(value!);
        break;
      default:
    }
  }

  void searchMesh() {
    switch (MesheType.fromString(meshType!.type)) {
      case MesheType.byFederationUnit:
        break;
      case MesheType.byMesoregion:
        break;
      case MesheType.byMicroregion:
        break;
      case MesheType.byMunicipality:
        break;
      case MesheType.byCountry:
        break;
      case MesheType.byRegionOfBrazil:
        break;
      case MesheType.byImmediateRegion:
        break;
      case MesheType.byIntermediateRegion:
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    dataProvider = Provider.of<DataProvider>(context);

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
        child: Center(
          child: Form(
            key: _formKey,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Responsive.isDesktop(context) || Responsive.isTablet(context)
                      ? Row(children: [
                          Expanded(child: buildDropdownMeshType()),
                          Utils.addHorizontalSpace(10),
                          Expanded(child: buildDropdownIntraRegion()),
                        ])
                      : Column(
                          children: [
                            buildDropdownMeshType(),
                            Utils.addVerticalSpace(20),
                            buildDropdownIntraRegion()
                          ],
                        ),
                  Utils.addVerticalSpace(20),
                  Responsive.isDesktop(context) || Responsive.isTablet(context)
                      ? Row(children: [
                          Expanded(child: buildDropdownState()),
                          Utils.addHorizontalSpace(10),
                          Expanded(child: buildDropdownCity()),
                        ])
                      : Column(
                          children: [
                            buildDropdownState(),
                            Utils.addVerticalSpace(20),
                            buildDropdownCity()
                          ],
                        ),
                  Utils.addVerticalSpace(20),
                  Responsive.isDesktop(context) || Responsive.isTablet(context)
                      ? Row(children: [
                          Expanded(child: buildDropdownMesoregions()),
                          Utils.addHorizontalSpace(10),
                          Expanded(child: buildDropdownMicroregions()),
                        ])
                      : Column(
                          children: [
                            buildDropdownMesoregions(),
                            Utils.addVerticalSpace(20),
                            buildDropdownMicroregions()
                          ],
                        ),
                  Utils.addVerticalSpace(20),
                  Responsive.isDesktop(context) || Responsive.isTablet(context)
                      ? Row(children: [
                          Expanded(child: buildDropdownImmediateRegion()),
                          Utils.addHorizontalSpace(10),
                          Expanded(child: buildDropdownIntermediateRegion()),
                        ])
                      : Column(
                          children: [
                            buildDropdownImmediateRegion(),
                            Utils.addVerticalSpace(20),
                            buildDropdownIntermediateRegion()
                          ],
                        ),
                  Utils.addVerticalSpace(20),
                  Responsive.isDesktop(context)
                      ? Row(children: [
                          Expanded(child: buildDropdownRegion()),
                          Utils.addHorizontalSpace(10),
                          Expanded(child: buildDropdownCountries()),
                        ])
                      : Column(
                          children: [
                            buildDropdownRegion(),
                            Utils.addVerticalSpace(20),
                            buildDropdownCountries()
                          ],
                        ),
                  Utils.addVerticalSpace(40),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          searchMesh();
                        }
                      },
                      child: const Text('Pesquisar'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // campo região
  Widget buildDropdownRegion() {
    return CustomDropdownButton<String?>(
      label: 'Região',
      hint: 'Selecione a região do Brasil',
      items: dataProvider.regions?.map((item) {
            return DropdownMenuItem<String>(
              value: item['sigla'],
              child: Text(item['nome']),
            );
          }).toList() ??
          [],
      onChanged: (String? value) {
        setState(() {
          region = value;
        });

        debugPrint(region);
      },
      validate: true,
      value: region,
    );
  }

  // campo países
  Widget buildDropdownCountries() {
    return CustomDropdownButton<String?>(
      label: 'Países',
      hint: 'Selecione o país',
      items: dataProvider.countries?.map((item) {
            return DropdownMenuItem<String>(
              value: item['id']['ISO-ALPHA-2'],
              child: Text(item['nome']),
            );
          }).toList() ??
          [],
      onChanged: (String? value) {
        setState(() {
          country = value;
        });

        debugPrint(country);
      },
      validate: true,
      value: country,
    );
  }

  // campo tipo de malha
  Widget buildDropdownMeshType() {
    return CustomDropdownButton<Mesh?>(
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
          dataProvider.resetLists();

          meshType = mesh;
          intraRegionSelected = null;

          intraRegionOptions = mesh!.intraRegionOptions;

          enableDropdownsByMeshType();
        });

        debugPrint(intraRegionOptions.toString());
      },
      validate: true,
      value: meshType,
    );
  }

  // campo intrarregiao
  Widget buildDropdownIntraRegion() {
    return CustomDropdownButton<String?>(
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
      validate: true,
      value: intraRegionSelected,
    );
  }

  // campo estado
  Widget buildDropdownState() {
    return CustomDropdownButton<String?>(
        label: 'Estados',
        hint: 'Selecione o estado',
        items: dataProvider.states?.map((item) {
              return DropdownMenuItem(
                value: item['sigla'].toString(),
                child: Text(
                  item['nome'],
                ),
              );
            }).toList() ??
            [],
        validate: true,
        value: state,
        onChanged: (String? value) {
          setState(() {
            state = value;

            enableDropdownsByState(value);
          });
        });
  }

  // campo cidade/município
  Widget buildDropdownCity() {
    return CustomDropdownButton<String?>(
        label: 'Cidades',
        hint: 'Selecione a cidade',
        items: dataProvider.cities?.map((item) {
              return DropdownMenuItem(
                value: item['id'].toString(),
                child: Text(
                  item['nome'],
                ),
              );
            }).toList() ??
            [],
        validate: true,
        value: city,
        onChanged: (String? value) {
          setState(() {
            city = value;
          });

          debugPrint('Cidade $value');
        });
  }

  // campo mesorregião
  Widget buildDropdownMesoregions() {
    return CustomDropdownButton<String?>(
        label: 'Mesorregiões',
        hint: 'Selecione a mesorregião',
        items: dataProvider.mesoregions?.map((item) {
              return DropdownMenuItem(
                value: item['id'].toString(),
                child: Text(
                  item['nome'],
                ),
              );
            }).toList() ??
            [],
        validate: true,
        value: mesoregion,
        onChanged: (String? value) {
          setState(() {
            mesoregion = value;
          });

          debugPrint('Mesorregião $value');
        });
  }

  // campo microrregião
  Widget buildDropdownMicroregions() {
    return CustomDropdownButton<String?>(
        label: 'Microrregiões',
        hint: 'Selecione a microrregião',
        items: dataProvider.microregions?.map((item) {
              return DropdownMenuItem(
                value: item['id'].toString(),
                child: Text(
                  item['nome'],
                ),
              );
            }).toList() ??
            [],
        validate: true,
        value: microregion,
        onChanged: (String? value) {
          setState(() {
            microregion = value;
          });

          debugPrint('Microrregião $value');
        });
  }

  // campo região imediata
  Widget buildDropdownImmediateRegion() {
    return CustomDropdownButton<String?>(
        label: 'Região imediata',
        hint: 'Selecione a região imediata',
        items: dataProvider.immediateRegions?.map((item) {
              return DropdownMenuItem(
                value: item['id'].toString(),
                child: Text(
                  item['nome'],
                ),
              );
            }).toList() ??
            [],
        validate: true,
        value: immediateRegion,
        onChanged: (String? value) {
          setState(() {
            immediateRegion = value;
          });

          debugPrint('região imediata $value');
        });
  }

  // Por região intermediária
  Widget buildDropdownIntermediateRegion() {
    return CustomDropdownButton<String?>(
        label: 'Região intermediária',
        hint: 'Selecione a região intermediária',
        items: dataProvider.intermediateRegions?.map((item) {
              return DropdownMenuItem(
                value: item['id'].toString(),
                child: Text(
                  item['nome'],
                ),
              );
            }).toList() ??
            [],
        validate: true,
        value: intermediateRegion,
        onChanged: (String? value) {
          setState(() {
            intermediateRegion = value;
          });

          debugPrint('região intermediária $value');
        });
  }
}
