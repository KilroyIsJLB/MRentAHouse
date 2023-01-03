import 'package:locations/models/habitation.dart';
import 'package:locations/models/typehabitat.dart';
import 'package:locations/repositories/base_api_client.dart';
import 'package:locations/repositories/habitation_api_client.dart';

class HabitationApiClientImpl extends BaseApPiClient<Habitation> implements HabitationApiClient {
  static const String uri = 'https://wshabitation.montpellier.epsi.fr/api/v1/habitations';

  HabitationApiClientImpl() : super(uri);

  @override
  Habitation createFromJson(Map<String, dynamic> json) {
    return Habitation.fromJson(json);
  }

  @override
  Map<String, dynamic> convertToJson(Habitation t) {
    // TODO: implement convertToJson
    throw UnimplementedError();
  }

  @override
  Future<List<Habitation>> getHabitations() async {
    return super.getAll("");
  }

  @override
  Future<Habitation> getHabitation(int id) async {
    return super.getOne(id.toString());
  }

  @override
  Future<List<Habitation>> getHabitationsTop10() {
    return super.getAll("top10");
  }

  @override
  Future<List<Habitation>> getHabitationsById(List<int> habitationsIds) async {
    List<Habitation> habitations = await getHabitations();
    return habitations.takeWhile((value) => habitationsIds.contains(value.id)).toList();
  }

  @override
  Future<List<Habitation>> getAppartements() {
    return super.getAll("typehabitat/${TypeHabitat.APPARTEMENT}");
  }

  @override
  Future<List<Habitation>> getMaisons() {
    return super.getAll("typehabitat/${TypeHabitat.MAISON}");
  }

}
