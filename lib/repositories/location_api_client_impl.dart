import 'package:locations/models/location.dart';
import 'package:locations/repositories/base_api_client.dart';

import 'location_api_client.dart';

class LocationApiClientImpl extends BaseApPiClient<Location> implements LocationApiClient {
  static const String uri = 'http://10.0.2.2:7117/api/v1/locations';

  LocationApiClientImpl() : super(uri);

  @override
  Location createFromJson(Map<String, dynamic> json) {
    return Location.fromJson(json);
  }
  @override
  Map<String, dynamic> convertToJson(Location t) {
    return t.toJson();
  }

  @override
  Future<List<Location>> getLocations() async {
    return super.getAll("");
  }

  @override
  Future<Location> getLocation(int id) async {
    return super.getOne(id.toString());
  }

  @override
  Future<Location> addLocation(Location location) {
    return super.add(location.id.toString(), location);
  }

  @override
  Future<bool> deleteLocation(int id) {
    return super.remove(id.toString());
  }
}