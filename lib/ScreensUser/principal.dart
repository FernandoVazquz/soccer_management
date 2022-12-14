// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import '../ScreensUser/notifications.dart';
import '../api/bd_users.dart';
import 'joinLeague.dart';
import 'joinTeam.dart';
import 'team.dart';

// ignore: use_key_in_widget_constructors
class PrincipalPage extends StatelessWidget {
  static String id = "Principal_page";
  final int _cantTeams = 0;
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      appBar: AppBar(
        backgroundColor: const Color(0xffF4F4F4),
        leading: IconButton(
          padding: EdgeInsets.only(right: sizeScreen.width * .02),
          color: const Color(0xFF011C53),
          icon: const Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {
            Route route = MaterialPageRoute(builder: (bc) => JoinLeaguePage());
            Navigator.of(context).push(route);
          },
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: sizeScreen.width * .02),
            color: const Color(0xFF011C53),
            icon: const Icon(
              Icons.notifications_none,
            ),
            onPressed: () {
              Route route =
                  MaterialPageRoute(builder: (bc) => NotificationsPage());
              Navigator.of(context).push(route);
            }, // Accion de la notificacion
          ),
        ],
        /*
         * Teto de pantalla 
        */
        title: const Text(
          'Equipos',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lato',
          ),
        ),
        centerTitle: true,
      ),
      body: _body(sizeScreen, _cantTeams),
    ));
  }
}

Widget _body(Size sizeScreen, int _cantTeams) {
  bool hTeam; // validacion con Query para saber si se tiene equipo
  (_cantTeams == 0) ? hTeam = false : hTeam = true;

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      /*
              * Imagen del usuario.
            */
      Container(
        padding: EdgeInsets.only(top: sizeScreen.width * .1),
        alignment: Alignment.topCenter,
        child: const Icon(
          Icons.person_rounded,
          size: 70,
        ),
      ),
      /**
           * Nombre del jugador
           */
      Text(
        (usersName.containsKey(correoo))
            ? '${usersName[correoo]}'
            : (refereesName.containsKey(correoo))
                ? '${refereesName[correoo]}'
                : 'Error al obtener el nombre',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato',
        ),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: sizeScreen.height * .01),

      /**
             * Linea horizontal.
            */
      Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFE51E3F),
              width: 2,
            ),
          ),
        ),
      ),
      SizedBox(height: sizeScreen.height * .002),

      /**
       * Contenedor de la etiqueta
      */
      _etiqueta((!hTeam) ? 'Sin equipos' : 'Selecciona un equipo', sizeScreen),

      Expanded(
        child: ListView.builder(
          itemCount: _cantTeams,
          itemBuilder: (context, int index) {
            return GestureDetectorTeams(
                'Colibri', 'Venom', sizeScreen, context);
          },
        ),
      ),
      //_button(context, size),
    ],
  );
}

// widget para los equipos
GestureDetector GestureDetectorTeams(
    String NameLeague, String NameTeam, Size sizeScreen, BuildContext context) {
  return GestureDetector(
    child: Card(
      elevation: 7,
      shadowColor: Color(0xFFE51E3F),
      child: ListTile(
        leading: const CircleAvatar(),
        title: Text(NameLeague),
        subtitle: Text(NameTeam),
      ),
    ),
    onTap: () {
      Navigator.pushNamed(context, TeamPage.id);
    },
  );
}

// ignore: unused_element
Widget _button(context, Size size) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      alignment: Alignment(size.width / 2, size.height),
      primary: const Color(0xFF011C53),
      padding: EdgeInsets.symmetric(
        vertical: size.width * .05,
        horizontal: size.width * .2,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    child: const Text(
      'Inscribirte a un equipo',
      style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato'),
    ),
    onPressed: () {
      Route route = MaterialPageRoute(builder: (bc) => JoinTeamPage());
      Navigator.of(context).push(route);
    },
  );
}

/*
 * Seccion de metodos y funciones
*/

Widget _etiqueta(String name, Size size) {
  return _etiquetaclase(
    name: name,
    sizeScreen: size,
  );
}

// ignore: camel_case_types
class _etiquetaclase extends StatelessWidget {
  final String name;
  final Size sizeScreen;

  const _etiquetaclase({
    required this.name,
    required this.sizeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: sizeScreen.height * .01),
      decoration: const BoxDecoration(
        color: Color(0xFF011C53),
      ),
      height: sizeScreen.height * .04,
      width: double.infinity,
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
