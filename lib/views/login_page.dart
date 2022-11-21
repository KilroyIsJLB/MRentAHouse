import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:locations/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'register_page.dart';

class LoginPageArgument {
  final String routeNameNext;

  LoginPageArgument(this.routeNameNext);
}

class LoginPage extends StatefulWidget {
  static String routeName = 'login';
  final String routeNameNext;

  const LoginPage(this.routeNameNext, {Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;
  final _Account account = _Account();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          Image.asset('assets/images/locations/location.png'),
          const SizedBox(height: 30.0),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) => EmailValidator.validate(value!)
                      ? null
                      : "Entrez un email valide",
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onSaved: (value) => setState(() => account.email = value!),
                ),
                const SizedBox(height: 12.0),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Entrez un mot de passe';
                    }
                    return null;
                  },
                  maxLines: 1,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    hintText: 'Mot de passe',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onSaved: (value) => setState(() => account.password = value!),
                ),
                CheckboxListTile(
                  title: const Text("Se souvenir de moi"),
                  contentPadding: EdgeInsets.zero,
                  value: rememberValue,
                  activeColor: Theme.of(context).colorScheme.primary,
                  onChanged: (newValue) {
                    setState(() {
                      rememberValue = newValue!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                const SizedBox(height: 12.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _logUser(context);
                    }
                  },
                  child: const Text('Valider'),
                ),
                const SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Pas enregistré ?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RegisterPage(widget.routeNameNext),
                          ),
                        );
                      },
                      child: const Text('Créer un compte'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _logUser(BuildContext context) async {
    // TODO : faire la connection Utilisateur;
    if (rememberValue) {
      // https://docs.flutter.dev/cookbook/persistence/key-value
      // obtain shared preferences
      final prefs = await SharedPreferences.getInstance();
      // set value
      await prefs.setString('RAH_email', account.email);
      await prefs.setString('RAH_pwd', account.password);
    }
    // account
    print('_logUser: $account');
    // Navigator.popAndPushNamed(context, widget.routeNameNext);
    // Affichage de la page et vidage de la pile des pages (sauf la première page : home)
    Navigator.pushNamedAndRemoveUntil(
        context, widget.routeNameNext, (route) => route.isFirst);
  }
}

class _Account {
  String email = '';
  String password = '';

  @override
  String toString() {
    return '_Account{email: $email, password: $password}';
  }
}