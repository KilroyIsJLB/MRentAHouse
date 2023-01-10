
class TypeHabitat {
  int id;
  String libelle;

  static const MAISON = 1;
  static const APPARTEMENT = 2;

  TypeHabitat(this.id, this.libelle);
  TypeHabitat.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        libelle = json['libelle'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'libelle': libelle
    };
  }
}