import 'package:flutter/material.dart';
import 'package:locations/views/share/bottom_navigation_bar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_cubit.dart';
import '../models/location.dart';
import '../services/location_service.dart';
import '../share/location_text_style.dart';


class ValidationLocationPageArgument {
  final Location location;
  ValidationLocationPageArgument(this.location);
}

class ValidationLocation extends StatefulWidget {
  static String routeName = '/validationlocation';
  const ValidationLocation({Key? key}) : super(key: key);

  @override
  State<ValidationLocation> createState() => _ValidationLocationsState();
}

class _ValidationLocationsState extends State<ValidationLocation> {

  final LocationService _locationService = LocationService();
  late Future<Location> _location;


  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    _location = _ajoutLocation(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Validation'),
      ),
      body: Center(
        child: FutureBuilder<Location>(
          future: _location,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Center(
                child: Text('Location ajoutée'),
              );
            } else if (snapshot.hasError) {
              return Center(
                  child: Text(
                    "Impossible d'ajouter la location : ${snapshot.error}",
                    style: LocationTextStyle.errorTextStyle,
                  ));
            }
            // By default, show a loading spinner.
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(2),
    );
  }

  Future<Location> _ajoutLocation(BuildContext context) async {

    final args =
      ModalRoute.of(context)!.settings.arguments as ValidationLocationPageArgument;

    // Obtention de l'état actuel
    UserState state = context.read<UserCubit>().state;
    // Pour être sûr
    args.location.idutilisateur = state.user.id;

     return _locationService.addLocation(args.location);
  }
}
