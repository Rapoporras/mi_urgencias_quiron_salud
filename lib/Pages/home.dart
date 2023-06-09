import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mi_urgencias_quiron_salud/Pages/configuracion.dart';
import 'package:mi_urgencias_quiron_salud/Pages/miurgencias.dart';
import 'package:quickalert/quickalert.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static List<Widget> _widgetOptions = <Widget>[MiUrgencias(), Configuracion()];

  void generarOpcionAleatoria() {
    setState(() {
      // Genera un número aleatorio entre 0 y 1
      var random = Random().nextInt(2);

      if (random == 0) {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.info,
            title: 'Visita a Consulta',
            text: 'Puede acudir a la visita con el Médico. Consulta 3',
            backgroundColor: Color(0xFFFFFFFF),
            titleColor: Color(0xFF4B4E53),
            textColor: Color(0xFF4B4E53),
            confirmBtnColor: Color(0xFF00A6A0),
            confirmBtnTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: "Open Sans",
                fontSize: 18.0));
      } else {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            title: 'Prueba Completada',
            text: 'Su Analisis de Sangre se ha completado.',
            backgroundColor: Color(0xFFFFFFFF),
            titleColor: Color(0xFF4B4E53),
            textColor: Color(0xFF4B4E53),
            confirmBtnColor: Color(0xFF00A6A0),
            confirmBtnTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: "Open Sans",
                fontSize: 18.0));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: const Color(0xFF4B4E53),
          // Here we take the value from the LoginPage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Image(
            width: 200,
            image: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/mi-urgencias-quiron-salud.appspot.com/o/image%201.png?alt=media&token=62871bcd-ff4b-4957-9b61-82bff3e67fa6&_gl=1*xgy7pz*_ga*MzkzNTk4NzYyLjE2ODI5NzI2MDI.*_ga_CW55HF8NVT*MTY4NTg5MDYyNi4yLjEuMTY4NTg5MTE4NS4wLjAuMA..'),
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    generarOpcionAleatoria();
                  },
                  child: Icon(
                    Icons.notifications_active,
                    color: Colors.white,
                  ),
                )),
          ],
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Color(0xFF00A6A0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  rippleColor: const Color(0xFF00C9C2),
                  hoverColor: const Color.fromARGB(255, 110, 231, 227),
                  gap: 8,
                  haptic: true, // haptic
                  activeColor: Colors.white,
                  iconSize: 24,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: const Duration(milliseconds: 400),
                  tabBackgroundColor: const Color(0xFF00C9C2),
                  color: Colors.white,
                  tabs: const [
                    GButton(
                      icon: LineIcons.heartbeat,
                      text: 'Mi urgencias',
                      textStyle: TextStyle(
                          fontFamily: "Open Sans",
                          color: Colors.white,
                          fontSize: 14),
                    ),
                    GButton(
                      icon: Icons.settings,
                      text: 'Configuración',
                      textStyle: TextStyle(
                          fontFamily: "Open Sans",
                          color: Colors.white,
                          fontSize: 14),
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              ),
            )));
  }
}
