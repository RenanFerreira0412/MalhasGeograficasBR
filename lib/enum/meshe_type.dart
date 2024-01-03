class MesheType {
  static const byFederationUnit = MesheType._('Por Unidade da Federação');
  static const byMesoregion = MesheType._('Por mesorregião');
  static const byMicroregion = MesheType._('Por microrregião');
  static const byMunicipality = MesheType._('Por município');
  static const byCountry = MesheType._('Por país');
  static const byRegionOfBrazil = MesheType._('Por região do Brasil');
  static const byImmediateRegion = MesheType._('Por região imediata');
  static const byIntermediateRegion = MesheType._('Por região intermediária');

  final String value;

  const MesheType._(this.value);

  factory MesheType.fromString(String value) {
    switch (value) {
      case 'Por Unidade da Federação':
        return byFederationUnit;
      case 'Por mesorregião':
        return byMesoregion;
      case 'Por microrregião':
        return byMicroregion;
      case 'Por município':
        return byMunicipality;
      case 'Por país':
        return byCountry;
      case 'Por região do Brasil':
        return byRegionOfBrazil;
      case 'Por região imediata':
        return byImmediateRegion;
      case 'Por região intermediária':
        return byIntermediateRegion;
      default:
        throw ArgumentError('Valor inválido para MesheType: $value');
    }
  }
}
