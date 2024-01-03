import 'package:malhas_geograficas_br/enum/meshe_type.dart';
import 'package:malhas_geograficas_br/models/mesh.dart';
import 'package:malhas_geograficas_br/repositories/intra_region_repository.dart';

class MesheRepository {
  static final IntraRegionRepository _intraRegion = IntraRegionRepository();

  static List<Mesh> meshes = [
    Mesh(
        type: MesheType.byFederationUnit.value,
        path: 'estados',
        intraRegionOptions: _intraRegion.byFederationUnitOptions),
    Mesh(
        type: MesheType.byMesoregion.value,
        path: 'mesorregioes',
        intraRegionOptions: _intraRegion.byMesoregionOptions),
    Mesh(
        type: MesheType.byMicroregion.value,
        path: 'microrregioes',
        intraRegionOptions: _intraRegion.byMicroregionOptions),
    Mesh(
        type: MesheType.byMunicipality.value,
        path: 'municipios',
        intraRegionOptions: []),
    Mesh(
        type: MesheType.byCountry.value,
        path: 'paises',
        intraRegionOptions: _intraRegion.byCountryOptions),
    Mesh(
        type: MesheType.byRegionOfBrazil.value,
        path: 'regioes',
        intraRegionOptions: _intraRegion.byRegionOfBrazilOptions),
    Mesh(
        type: MesheType.byImmediateRegion.value,
        path: 'regioes-imediatas',
        intraRegionOptions: _intraRegion.byImmediateRegionOptions),
    Mesh(
        type: MesheType.byIntermediateRegion.value,
        path: 'regioes-intermediarias',
        intraRegionOptions: _intraRegion.byIntermediateRegionOptions),
  ];
}
