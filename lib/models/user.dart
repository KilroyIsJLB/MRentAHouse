
class User {
  final int id;
  final String email;
  final String nom;
  final String prenom;
  int nbLocations;

  User(this.email, this.id, {this.prenom = '', this.nom = '', this.nbLocations = 0});

  bool isEmpty() {
    return email == '-';
  }
  static User empty = User('-', 0);
}
