
import 'option.dart';
import 'typehabitat.dart';

class Habitation {
  int id;
  TypeHabitat typeHabitat;
  String image;
  String libelle;
  String adresse;
  int nbpersonnes;
  int chambres;
  int superficie;
  double prixnuit;
  int lits;
  int salleBains;
  List<Option> options;
  List<OptionPayante> optionpayantes;

  Habitation(this.id, this.typeHabitat, this.image, this.libelle, this.adresse,
      this.nbpersonnes, this.chambres, this.lits, this.salleBains,
      this.superficie, this.prixnuit,
      {this.options = const [], this.optionpayantes = const []});
  Habitation.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        typeHabitat = TypeHabitat.fromJson(json['typehabitat']),
        image = json['image'],
        libelle = json['libelle'],
        adresse = json['adresse'],
        nbpersonnes = json['habitantsmax'],
        chambres = json['chambres'],
        lits = json['lits'],
        salleBains = json['sdb'],
        superficie = json['superficie'],
        prixnuit = json['prixnuit'] * 1.0,
        options = (json['items'] as List)
            .map((item) => Option.fromJson(item))
            .toList(),
        optionpayantes = (json['optionpayantes'] as List)
            .map((item) => OptionPayante.fromJson(item))
            .toList();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'id': id,
      'typeHabitat': typeHabitat.toJson(),
      'image': image,
      'libelle': libelle,
      'adresse': adresse,
      'nbpersonnes': nbpersonnes,
      'chambres': chambres,
      'lits': lits,
      'salleBains': salleBains,
      'superficie': superficie,
      'prixnuit': prixnuit,
      'options': options.map((e) => e.toJson()),
      'optionpayantes': optionpayantes.map((e) => e.toJson())
    };
    if (options.isNotEmpty) {
      List<Map> optionsMap = options.map((i) => i.toJson()).toList();
      json.putIfAbsent('options', () => optionsMap);
    }
    if (optionpayantes.isNotEmpty) {
      List<Map> optionpayantesMap = optionpayantes.map((i) => i.toJson()).toList();
      json.putIfAbsent('optionpayantes', () => optionpayantesMap);
    }

    return json;
  }
}
