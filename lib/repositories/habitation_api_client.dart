
import '../models/habitation.dart';


abstract class HabitationApiClient {
  Future<List<Habitation>> getHabitationsTop10();
  Future<List<Habitation>> getMaisons();
  Future<List<Habitation>> getAppartements();
  Future<List<Habitation>> getHabitations();
  Future<List<Habitation>> getHabitationsById(List<int> habitationsIds);

  Future<Habitation> getHabitation(int id);
}