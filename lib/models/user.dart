
class User {
  int id;
  String email;
  String password;
  String nom;
  String prenom;
  int nbLocations;

  User(this.email, this.id, {this.password = '', this.prenom = '', this.nom = '', this.nbLocations = 0});

  bool isEmpty() {
    return email == '-';
  }
  void setEmpty() {
    email = '-';
    id = 0;
  }
  static User empty = User('-', 0);

  @override
  String toString() {
    return '_Account{email: $email, password: $password}';
  }
}
