import 'package:locations/models/location.dart';
import 'package:collection/collection.dart';

import '../models/habitation.dart';
import '../repositories/location_api_client.dart';
import '../repositories/location_api_client_impl.dart';
import 'habitation_service.dart';

class LocationService {
  final LocationApiClient _locationApiClient;

  LocationService() :
        //locationApiClient = LocationApiData();
        _locationApiClient = LocationApiClientImpl();

  Future<List<Location>> getLocations() async {
    List<Location> list = await _locationApiClient.getLocations();

    // Obtention des habitations
    List<int> habitationsIds = [];
    // Construction de la liste des Ids des habitations
    for (Location location in list) {
      if (! habitationsIds.contains(location.idhabitation)) {
        habitationsIds.add(location.idhabitation);
      }
    }

    // Obtention des habitations
    HabitationService service = HabitationService();
    List<Habitation> habitations = await service.getHabitations(habitationsIds);
    for (Location location in list) {
      // Recherche des habitations
      Habitation? habitation = habitations.firstWhereOrNull(
              (element) => element.id == location.idhabitation);
      location.habitation = habitation;
    }

    return list;
  }

  Future<Location> getLocation(int id) {
    return _locationApiClient.getLocation(id);
  }

  Future<Location> addLocation(Location location) {
    return _locationApiClient.addLocation(location);
  }

  Future<bool> deleteLocation(int id) {
    return _locationApiClient.deleteLocation(id);
  }
}