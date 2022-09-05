import 'package:locations/models/location.dart';
import 'package:collection/collection.dart';

import '../models/habitation.dart';
import '../models/locations_data.dart';
import 'habitation_service.dart';

class LocationService {
  late List<Location> _locations;

  LocationService() {
    _locations = LocationsData.buildList();
  }

  List<Location> getLocations() {
    List<Location> list = _locations;

    // Obtention des habitations
    List<int> habitationsIds = [];
    // Construction de la liste des Ids des habitations
    for (Location location in list) {
      habitationsIds.add(location.id);
    }

    // Obtention des habitations
    HabitationService service = HabitationService();
    List<Habitation> habitations = service.getHabitations(habitationsIds);
    for (Location location in list) {
      // Recherche des habitations
      Habitation? habitation = habitations.firstWhereOrNull(
              (element) => element.id == location.idhabitation);
      location.habitation = habitation;
    }

    return list;
  }

  Location getLocation(int id) {
    return _locations.where((element) => element.id == id).first;
  }
}