import 'package:malhas_geograficas_br/models/intra_region.dart';

// classe responsável por representar as malhas geográficas
class Mesh {
  final String type;
  late final String path;
  final List<IntraRegion> intraRegionOptions;

  Mesh(
      {required this.type,
      required this.path,
      required this.intraRegionOptions});
}
