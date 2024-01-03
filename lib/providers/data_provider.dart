import 'package:flutter/material.dart';
import 'package:malhas_geograficas_br/services/data_service.dart';

class DataProvider extends ChangeNotifier {
  List? states;
  List? cities;
  List? mesoregions;
  List? microregions;
  List? regions;
  List? immediateRegions;
  List? intermediateRegions;
  List? countries;

  Services services = Services();

  DataProvider() {
    _getStates();
  }

  Future<void> _getStates() async {
    states = await services.getStates();
    //debugPrint(states.toString());
    notifyListeners();
  }

  Future<void> getCities(String uf) async {
    debugPrint('pegando as cidades');
    cities = await services.getCities(uf);
    //debugPrint(cities.toString());
    notifyListeners();
  }

  Future<void> getMesoregions(String uf) async {
    debugPrint('pegando as Mesorregiões');
    mesoregions = await services.getMesoregions(uf);
    //debugPrint(mesoregions.toString());
    notifyListeners();
  }

  Future<void> getMicroregions(String uf) async {
    debugPrint('pegando as Microrregiões');
    microregions = await services.getMicroregions(uf);
    //debugPrint(microregions.toString());
    notifyListeners();
  }

  Future<void> getRegions() async {
    debugPrint('pegando as regiões');
    regions = await services.getRegions();
    //debugPrint(regions.toString());
    notifyListeners();
  }

  Future<void> getCountries() async {
    debugPrint('pegando os países');
    countries = await services.getCountries();
    //debugPrint(regions.toString());
    notifyListeners();
  }

  Future<void> getImmediateRegions(String uf) async {
    debugPrint('pegando as regiões imediatas');
    immediateRegions = await services.getImmediateRegions(uf);
    //debugPrint(immediateRegions.toString());
    notifyListeners();
  }

  Future<void> getIntermediateRegions(String uf) async {
    debugPrint('pegando as regiões intermediárias');
    intermediateRegions = await services.getIntermediateRegions(uf);
    //debugPrint(immediateRegions.toString());
    notifyListeners();
  }

  void resetLists() {
    cities = [];
    mesoregions = [];
    microregions = [];
    regions = [];
    immediateRegions = [];
    intermediateRegions = [];
    countries = [];
    notifyListeners();
  }
}
