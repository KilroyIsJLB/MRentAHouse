import 'package:locations/models/location.dart';

import '../models/locations_data.dart';
import 'location_api_client.dart';

class LocationApiData implements LocationApiClient {
  @override
  Future<List<Location>> getLocations() {
    return Future.delayed(
        const Duration(seconds: 1),
        () => LocationsData.buildList());
  }

  @override
  Future<Location> getLocation(int id) {
    Location location =
        LocationsData.buildList().
        where((element) => element.id == id).first;

    return Future.delayed(
        const Duration(seconds: 1),
        () => location);
  }

  @override
  Future<Location> addLocation(Location location) {
    // TODO: implement addLocation
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteLocation(int id) {
    // TODO: implement deleteLocation
    throw UnimplementedError();
  }
}
