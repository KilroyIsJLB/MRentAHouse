import 'package:locations/models/typehabitat.dart';

import 'base_api_client.dart';
import 'type_habitat_api_client.dart';

class TypeHabitatApiClientImpl extends BaseApPiClient<TypeHabitat> implements TypeHabitatApiClient {
  static const String uri = 'https://wshabitation.montpellier.epsi.fr/api/v1/';

  TypeHabitatApiClientImpl(super.baseUri);

  @override
  TypeHabitat createFromJson(Map<String, dynamic> json) {
    return TypeHabitat.fromJson(json);
  }

  @override
  Future<List<TypeHabitat>> getTypeHabitats() {
    return super.getAll('typehabitats');
  }

}