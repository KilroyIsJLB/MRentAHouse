
import '../models/typehabitat.dart';


abstract class TypeHabitatApiClient {
  Future<List<TypeHabitat>> getTypeHabitats();
}