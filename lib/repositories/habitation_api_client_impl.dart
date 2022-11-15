import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:locations/models/habitation.dart';
import 'package:locations/models/typehabitat.dart';
import 'package:locations/repositories/base_api_client.dart';
import 'package:locations/repositories/habitation_api_client.dart';

class HabitationApiClientImpl extends BaseApPiClient<Habitation> implements HabitationApiClient {
  static const String uri = 'https://wshabitation.montpellier.epsi.fr/api/v1/';

  HabitationApiClientImpl(super.baseUri);

  @override
  Habitation createFromJson(Map<String, dynamic> json) {
    return Habitation.fromJson(json);
  }

  @override
  Future<List<Habitation>> getHabitations() async {
    return super.getAll(uri);
  }

  @override
  Future<Habitation> getHabitation(int id) async {
    return super.getOne(uri, id);
  }

  @override
  Future<List<TypeHabitat>> getTypeHabitats() async {
    List<TypeHabitat> list = [];

    try {
      final response = await http.get(Uri.parse('$uri/typehabitats'));
      if (response.statusCode == HttpStatus.ok) {
        var json = jsonDecode(utf8.decode(response.bodyBytes));
        for(final value in json) {
          list.add(TypeHabitat.fromJson(value));
        }
      } else {
        throw Exception("Impossible de récupérer les type d'habitations");
      }
    } catch(e) {
      rethrow;
    }

    return list;
  }





  @override
  Future<List<Habitation>> getAppartements() {
    // TODO: implement getAppartements
    throw UnimplementedError();
  }

  @override
  Future<List<Habitation>> getHabitationsById(List<int> habitationsIds) {
    // TODO: implement getHabitationsById
    throw UnimplementedError();
  }

  @override
  Future<List<Habitation>> getHabitationsTop10() {
    // TODO: implement getHabitationsTop10
    throw UnimplementedError();
  }

  @override
  Future<List<Habitation>> getMaisons() {
    // TODO: implement getMaisons
    throw UnimplementedError();
  }

}

/*

class HabitationApiClientImpl implements HabitationApiClient {
  static const String uri = 'https://wshabitation.montpellier.epsi.fr/api/v1/';

  @override
  Future<List<Habitation>> getHabitations() async {
    List<Habitation> list = [];

    try {
      final response = await http.get(Uri.parse('$uri/habitations'));
      if (response.statusCode == HttpStatus.ok) {
        var json = jsonDecode(utf8.decode(response.bodyBytes));
        for(final value in json) {
          list.add(Habitation.fromJson(value));
        }
      } else {
        throw Exception('Impossible de récupérer les habitations');
      }
    } catch(e) {
      rethrow;
    }

    return list;
  }

  @override
  Future<Habitation> getHabitation(int id) async {
    try {
      final response = await http.get(Uri.parse('$uri/habitations/$id'));
      if (response.statusCode == HttpStatus.ok) {
        var json = jsonDecode(utf8.decode(response.bodyBytes));
        return Habitation.fromJson(json);
      } else {
        throw Exception('Impossible de récupérer les habitations');
      }
    } catch(e) {
      rethrow;
    }
  }

  @override
  Future<List<TypeHabitat>> getTypeHabitats() async {
    List<TypeHabitat> list = [];

    try {
      final response = await http.get(Uri.parse('$uri/typehabitats'));
      if (response.statusCode == HttpStatus.ok) {
        var json = jsonDecode(utf8.decode(response.bodyBytes));
        for(final value in json) {
          list.add(TypeHabitat.fromJson(value));
        }
      } else {
        throw Exception("Impossible de récupérer les type d'habitations");
      }
    } catch(e) {
      rethrow;
    }

    return list;
  }

 */