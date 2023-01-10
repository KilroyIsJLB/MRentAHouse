import 'package:intl/intl.dart';

import 'facture.dart';
import 'habitation.dart';
import 'option.dart';

class Location {
  int id;
  int idutilisateur;
  int idhabitation;
  DateTime dateDebut;
  DateTime dateFin;
  double montanttotal;
  double montantverse;
  Facture? facture;

  Habitation? habitation;
  List<OptionPayante> optionpayantes;

  Location(this.id, this.idutilisateur, this.idhabitation, this.dateDebut,
      this.dateFin, this.montanttotal, this.montantverse,
      {this.facture, this.habitation, this.optionpayantes = const []});

  Location.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        idutilisateur = json['idutilisateur'],
        idhabitation = json['idhabitation'],
        dateDebut = DateTime.parse(json['datedebut']),
        dateFin = DateTime.parse(json['datefin']),
        montanttotal =
            json['montanttotal'] * 1.0, // * 1.0 pour convertir en double
        montantverse = json['montantverse'] * 1.0,
        facture =
            json['facture'] == null ? null : Facture.fromJson(json['facture']),
        optionpayantes = json['locationoptionpayantes'] == null
            ? []
            : (json['locationoptionpayantes'] as List)
                .map((item) => OptionPayante.fromJson(item))
                .toList();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'id': id,
      'idutilisateur': idutilisateur,
      'idhabitation': idhabitation,
      'datedebut': DateFormat('yyyy-MM-dd').format(dateDebut),
      'datefin': DateFormat('yyyy-MM-dd').format(dateFin),
      'montanttotal': montanttotal,
      'montantverse': montantverse,
    };
    if (facture != null) {
      json.addAll({
        'facture': facture!.toJson(),
      });
    }
    if (optionpayantes.isNotEmpty) {
      List<Map> options = optionpayantes.map((i) => i.toJson()).toList();
      json.putIfAbsent('locationoptionpayantes', () => options);
    }

    return json;
  }

  @override
  String toString() {
    return 'Location{$toJson()}';
  }
}
