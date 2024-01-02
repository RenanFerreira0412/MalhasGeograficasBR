import 'package:malhas_geograficas_br/models/mesh.dart';
import 'package:malhas_geograficas_br/repositories/intra_region_repository.dart';

class MesheRepository {
  static final IntraRegionRepository _intraRegion = IntraRegionRepository();

  static List<Mesh> meshes = [
    Mesh(
        type: 'Por Unidade da Federação',
        path: 'estados',
        intraRegionOptions: _intraRegion.byFederationUnitOptions),
    Mesh(
        type: 'Por mesorregião',
        path: 'mesorregioes',
        intraRegionOptions: _intraRegion.byMesoregionOptions),
    Mesh(
        type: 'Por microrregião',
        path: 'microrregioes',
        intraRegionOptions: _intraRegion.byMicroregionOptions),
    Mesh(type: 'Por município', path: 'municipios', intraRegionOptions: []),
    Mesh(
        type: 'Por país',
        path: 'paises',
        intraRegionOptions: _intraRegion.byCountryOptions),
    Mesh(
        type: 'Por região do Brasil',
        path: 'regioes',
        intraRegionOptions: _intraRegion.byRegionOfBrazilOptions),
    Mesh(
        type: 'Por região imediata',
        path: 'regioes-imediatas',
        intraRegionOptions: _intraRegion.byImmediateRegionOptions),
    Mesh(
        type: 'Por região intermediária',
        path: 'regioes-intermediarias',
        intraRegionOptions: _intraRegion.byIntermediateRegionOptions),
  ];
}
