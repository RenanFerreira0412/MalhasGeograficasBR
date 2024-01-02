import 'package:malhas_geograficas_br/models/intra_region.dart';

class IntraRegionRepository {
  final List<IntraRegion> byFederationUnitOptions = [
    IntraRegion(type: 'mesorregiao', path: '?intrarregiao=mesorregiao'),
    IntraRegion(type: 'microrregiao', path: '?intrarregiao=microrregiao'),
    IntraRegion(type: 'municipio', path: '?intrarregiao=municipio')
  ];

  final List<IntraRegion> byMesoregionOptions = [
    IntraRegion(type: 'microrregiao', path: '?intrarregiao=microrregiao'),
    IntraRegion(type: 'municipio', path: '?intrarregiao=municipio')
  ];
  final List<IntraRegion> byMicroregionOptions = [
    IntraRegion(type: 'municipio', path: '?intrarregiao=municipio')
  ];

  final List<IntraRegion> byCountryOptions = [
    IntraRegion(type: 'regiao', path: '?intrarregiao=regiao'),
    IntraRegion(type: 'UF', path: '?intrarregiao=UF'),
    IntraRegion(type: 'mesorregiao', path: '?intrarregiao=mesorregiao'),
    IntraRegion(type: 'microrregiao', path: '?intrarregiao=microrregiao'),
    IntraRegion(type: 'municipio', path: '?intrarregiao=municipio')
  ];

  final List<IntraRegion> byRegionOfBrazilOptions = [
    IntraRegion(type: 'UF', path: '?intrarregiao=UF'),
    IntraRegion(type: 'mesorregiao', path: '?intrarregiao=mesorregiao'),
    IntraRegion(type: 'microrregiao', path: '?intrarregiao=microrregiao'),
    IntraRegion(type: 'municipio', path: '?intrarregiao=municipio')
  ];

  final List<IntraRegion> byImmediateRegionOptions = [
    IntraRegion(type: 'municipio', path: '?intrarregiao=municipio')
  ];

  final List<IntraRegion> byIntermediateRegionOptions = [
    IntraRegion(type: 'regiao-imediata', path: '?intrarregiao=regiao-imediata'),
    IntraRegion(type: 'municipio', path: '?intrarregiao=municipio')
  ];
}
