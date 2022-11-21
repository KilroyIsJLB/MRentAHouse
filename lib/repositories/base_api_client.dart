import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

abstract class BaseApPiClient<T> {
  final String baseUri;

  BaseApPiClient(this.baseUri);


  T createFromJson(Map<String, dynamic> json);

  Future<List<T>> getAll(String uri) async {
    List<T> list = [];

    try {
      final response = await http.get(Uri.parse(uri));
      if (response.statusCode == HttpStatus.ok) {
        var json = jsonDecode(utf8.decode(response.bodyBytes));
        for(final value in json) {
          list.add(createFromJson(value));
        }
      } else {
        throw Exception("Impossible de récupérer la liste depuis '$uri'");
      }
    } catch(e) {
      rethrow;
    }

    return list;
  }

  Future<T> getOne(String uri) async {
    try {
      final response = await http.get(Uri.parse(uri));
      if (response.statusCode == HttpStatus.ok) {
        var json = jsonDecode(utf8.decode(response.bodyBytes));
        return createFromJson(json);
      } else {
        throw Exception("Impossible de récupérer la liste depuis '$uri'");
      }
    } catch(e) {
      rethrow;
    }
  }
}