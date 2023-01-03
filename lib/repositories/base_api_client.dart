import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

abstract class BaseApPiClient<T> {
  final String baseUri;

  BaseApPiClient(this.baseUri);


  T createFromJson(Map<String, dynamic> json);
  Map<String, dynamic> convertToJson(T t);

  Future<List<T>> getAll(String uri) async {
    String finalUri = uri.isEmpty ? baseUri : "$baseUri/$uri";
    List<T> list = [];

    try {
      final response = await http.get(Uri.parse(finalUri));
      if (response.statusCode == HttpStatus.ok) {
        var json = jsonDecode(utf8.decode(response.bodyBytes));
        for(final value in json) {
          list.add(createFromJson(value));
        }
      } else {
        throw Exception("Impossible de récupérer la liste depuis '$finalUri'");
      }
    } catch(e) {
      rethrow;
    }

    return list;
  }

  Future<T> getOne(String id) async {
    String finalUri = "$baseUri/$id";

    try {
      final response = await http.get(Uri.parse(finalUri));
      if (response.statusCode == HttpStatus.ok) {
        var json = jsonDecode(utf8.decode(response.bodyBytes));
        return createFromJson(json);
      } else {
        throw Exception("Impossible de récupérer la liste depuis '$finalUri'");
      }
    } catch(e) {
      rethrow;
    }
  }

  Future<T> add(String id, T t) async {
    String finalUri = "$baseUri/$id";

    try {
      final response = await http.post(Uri.parse(finalUri), body: convertToJson(t));
      if (response.statusCode == HttpStatus.ok) {
        var json = jsonDecode(utf8.decode(response.bodyBytes));
        return createFromJson(json);
      } else {
        throw Exception("Impossible de créer l'objet ${t.toString()} depuis '$finalUri'");
      }
    } catch(e) {
      rethrow;
    }
  }

  Future<bool> remove(String id) async {
    String finalUri = "$baseUri/$id";

    try {
      final response = await http.delete(Uri.parse(finalUri));
      if (response.statusCode == HttpStatus.ok) {
        return true;
      } else {
        throw Exception("Impossible de supprimer l'objet d'id=$id depuis '$finalUri'");
      }
    } catch(e) {
      rethrow;
    }
  }
}