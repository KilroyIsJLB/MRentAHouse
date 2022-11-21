
class TypeHabitat {
  int id;
  String libelle;

  static const APPARTEMENT = 1;
  static const MAISON = 1;

  TypeHabitat(this.id, this.libelle);
  TypeHabitat.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        libelle = json['libelle'];
}