import 'package:flutter/material.dart';
import 'package:mi_urgencias_quiron_salud/main.dart';

class Configuracion extends StatefulWidget {
  const Configuracion({super.key});

  @override
  State<Configuracion> createState() => _ConfiguracionState();
}

class _ConfiguracionState extends State<Configuracion> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "MÁSTER UNIVERSITARIO EN GESTIÓN CLÍNICA AVANZADA DE ENFERMERÍA TRABAJO FIN DE MÁSTER",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF4B4E53),
                      fontFamily: "Open Sans",
                      fontWeight: FontWeight.w700,
                      fontSize: 22),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Plan director de gestor de tiempo de espera en los servicios de Urgencias de adultos",
                  style: TextStyle(
                    color: Color(0xFF4B4E53),
                    fontFamily: "Open Sans",
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "AUTORES:",
                  style: TextStyle(
                      color: Color(0xFF4B4E53),
                      fontFamily: "Open Sans",
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Rodríguez Enríquez, Alejandro",
                  style: TextStyle(
                      color: Color(0xFF4B4E53),
                      fontFamily: "Open Sans",
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Corral Díaz, Jordi",
                  style: TextStyle(
                      color: Color(0xFF4B4E53),
                      fontFamily: "Open Sans",
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Fuentes Sanz, Fernando",
                  style: TextStyle(
                      color: Color(0xFF4B4E53),
                      fontFamily: "Open Sans",
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Juliá Campos, Ángela",
                  style: TextStyle(
                      color: Color(0xFF4B4E53),
                      fontFamily: "Open Sans",
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "TUTORA:",
                  style: TextStyle(
                      color: Color(0xFF4B4E53),
                      fontFamily: "Open Sans",
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Font Jiménez, Isabel",
                  style: TextStyle(
                      color: Color(0xFF4B4E53),
                      fontFamily: "Open Sans",
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "MENTOR:",
                  style: TextStyle(
                      color: Color(0xFF4B4E53),
                      fontFamily: "Open Sans",
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Regaña Velázquez, Daniel",
                  style: TextStyle(
                      color: Color(0xFF4B4E53),
                      fontFamily: "Open Sans",
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                )
              ]),
        ),
        SizedBox(
          height: 80,
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: InkWell(
            child: Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color(0xFF00A6A0)),
                child: Center(
                  child: const Text(
                    'Cerrar Sesion',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Open Sans",
                        fontSize: 18),
                  ),
                )),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const LoginPage(title: 'Flutter Demo Home Page'),
                ),
              )
            },
          ),
        ),
        Center(
          child: Text(
            "App desarrollada por Ignacio Porras Ibáñez",
            style: TextStyle(
                color: Color(0xFF4B4E53),
                fontFamily: "Open Sans",
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}
