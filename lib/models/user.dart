
import 'location.dart';

class User {
  final String email;
  final String nom;
  final String prenom;

  int nbLocations = 0;

  User(this.email, {this.prenom = '', this.nom = ''});

  bool isEmpty() {
    return email == '-';
  }
  static User empty = User('-');
}
