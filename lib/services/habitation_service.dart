import '../models/habitation.dart';
import '../models/typehabitat.dart';
import '../repositories/habitation_api_client.dart';
import '../repositories/habitation_api_client_impl.dart';
import '../repositories/type_habitat_api_client.dart';
import '../repositories/type_habitat_api_client_impl.dart';
// import '../repositories/habitation_api_data_impl.dart';

class HabitationService {
  final HabitationApiClient habitationApiClient;
  final TypeHabitatApiClient typeHabitatApiClient;

  /*HabitationService() :
        habitationApiClient = HabitationApiData();*/

  HabitationService() :
        habitationApiClient = HabitationApiClientImpl('habitations'),
        typeHabitatApiClient = TypeHabitatApiClientImpl('typehabitats');

  Future<List<TypeHabitat>> getTypeHabitats() {
    return habitationApiClient.getTypeHabitats();
  }

  Future<List<Habitation>> getHabitationsTop10() {
    return habitationApiClient.getHabitationsTop10();
  }

  Future<List<Habitation>> getMaisons() {
    return habitationApiClient.getMaisons();
  }

  Future<List<Habitation>> getAppartements() {
    return habitationApiClient.getAppartements();
  }

  Future<List<Habitation>> getHabitations(List<int> habitationsIds) {
    return habitationApiClient.getHabitationsById(habitationsIds);
  }
}
