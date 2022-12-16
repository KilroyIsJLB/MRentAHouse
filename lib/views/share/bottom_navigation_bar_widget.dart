import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:locations/views/location_list.dart';
import 'package:locations/views/profil.dart';

import '../../bloc/user_cubit.dart';
import '../login_page.dart';
import 'badge_widget.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int indexSelected;
  const BottomNavigationBarWidget(this.indexSelected, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtention de l'état actuel
    UserState state = context.read<UserCubit>().state;
    bool isUserNotConnected = state.user.isEmpty();

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // plus de 3 éléments
      currentIndex: indexSelected,
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Accueil',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Recherche',
        ),
        BottomNavigationBarItem(
          icon: isUserNotConnected
              ? const Icon(Icons.shopping_cart_outlined)
              : BadgeWidget(
                  value: state.user.nbLocations,
                  top: 0,
                  right: 0,
                  child: const Icon(Icons.shopping_cart),
                ),
          label: 'locations',
        ),
        BottomNavigationBarItem(
          icon: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
            return isUserNotConnected
                ? const Icon(Icons.person)
                : const Icon(Icons.manage_accounts); // Connecté
          }),
          label: 'Profil',
        ),
      ],
      onTap: (index) {
        String page = '/';
        LoginPageArgument? lpArgs;
        switch (index) {
          case 2:
            // Si l'utilisateur n'est pas loggué,
            // il est redirigé vers la page de login
            if (isUserNotConnected) {
              page = LoginPage.routeName;
              lpArgs = LoginPageArgument(LocationList.routeName);
            } else {
              page = LocationList.routeName;
            }
            break;
          case 3:
            // Si l'utilisateur n'est pas loggué,
            // il est redirigé vers la page de login
            if (isUserNotConnected) {
              page = LoginPage.routeName;
              lpArgs = LoginPageArgument(Profil.routeName);
            } else {
              page = Profil.routeName;
            }
            break;
        }
        Navigator.pushNamedAndRemoveUntil(context, page, (route) => false);
      },
    );
  }
}
