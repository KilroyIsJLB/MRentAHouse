
class Option {
  int id;
  String libelle;
  String description;

  Option(this.id, this.libelle, {this.description = ""});
  Option.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        libelle = json['libelle'],
        description = json['description'];

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'libelle': libelle,
        'description': description
      };
}

class OptionPayante {
  Option option;
  double prix;
  int locationId = 0;
  int optionpayanteId = 0;

  OptionPayante(this.option, [this.prix = 0]);
  OptionPayante.fromJson(Map<String, dynamic> json)
      : option = Option.fromJson(json['optionpayante']),
        prix = json['prix'] * 1.0;

  Map<String, dynamic> toJson() {
    return {
      'optionpayante': option.toJson(),
      'locationId': locationId,
      'optionpayanteId': option.id,
      'prix': prix
    };
  }
}
