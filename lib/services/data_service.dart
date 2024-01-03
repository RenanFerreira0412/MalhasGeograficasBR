import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Services {
  List? _states;
  List? _cities;
  List? _mesoregions;
  List? _microregions;
  List? _regions;
  List? _immediateRegions;
  List? _intermediateRegions;
  List? _countries;

  Future<dynamic> fetchData(String uri) async {
    var url = Uri.parse(uri);

    List? data;

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        data = json.decode(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return data;
  }

  Future<dynamic> getStates() async {
    var url =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome';

    _states = await fetchData(url);

    return _states;
  }

  Future<dynamic> getCities(String uf) async {
    var url =
        "https://servicodados.ibge.gov.br/api/v1/localidades/estados/$uf/municipios?orderBy=nome";

    _cities = await fetchData(url);

    return _cities;
  }

  Future<dynamic> getMesoregions(String uf) async {
    var url =
        "https://servicodados.ibge.gov.br/api/v1/localidades/estados/$uf/mesorregioes?orderBy=nome";

    _mesoregions = await fetchData(url);

    return _mesoregions;
  }

  Future<dynamic> getMicroregions(String uf) async {
    var url =
        "https://servicodados.ibge.gov.br/api/v1/localidades/estados/$uf/microrregioes?orderBy=nome";

    _microregions = await fetchData(url);

    return _microregions;
  }

  Future<dynamic> getRegions() async {
    var url =
        "https://servicodados.ibge.gov.br/api/v1/localidades/regioes?orderBy=nome";

    _regions = await fetchData(url);

    return _regions;
  }

  Future<dynamic> getCountries() async {
    var url =
        "https://servicodados.ibge.gov.br/api/v1/localidades/paises?orderBy=nome";

    _countries = await fetchData(url);

    return _countries;
  }

  Future<dynamic> getImmediateRegions(String uf) async {
    var url =
        "https://servicodados.ibge.gov.br/api/v1/localidades/estados/$uf/regioes-imediatas?orderBy=nome";

    _immediateRegions = await fetchData(url);

    return _immediateRegions;
  }

  Future<dynamic> getIntermediateRegions(String uf) async {
    var url =
        "https://servicodados.ibge.gov.br/api/v1/localidades/estados/$uf/regioes-intermediarias?orderBy=nome";

    _intermediateRegions = await fetchData(url);

    return _intermediateRegions;
  }
}
