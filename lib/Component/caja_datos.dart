import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CajaDatos extends StatefulWidget {
  const CajaDatos({
    super.key,
    required this.fecha_nacimiento,
    required this.nombre,
    required this.fecha_consulta,
    required this.nivel_consulta,
  });

  final String fecha_nacimiento, nombre, fecha_consulta, nivel_consulta;

  @override
  State<CajaDatos> createState() => _CajaDatosState();
}

class _CajaDatosState extends State<CajaDatos> {
  final now = DateTime.now();
  String obtenerNumeroAleatorio() {
    Random random = Random();
    int numeroAleatorio = random.nextInt(90000000) +
        10000000; // Genera un número aleatorio de 8 dígitos
    return numeroAleatorio.toString();
  }

  Color obtenerColorPorPrioridad(String prioridad) {
    switch (prioridad) {
      case "1":
        return Color(0xFFD92323);
      case "2":
        return Color(0xFFF27405);
      case "3":
        return Color(0xFFF2BD1D);
      case "4":
        return Color(0xFF1CA63F);
      case "5":
        return Color(0xFF4E64A6);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF4B4E53),
            borderRadius: BorderRadius.all(Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 15,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/mi-urgencias-quiron-salud.appspot.com/o/Account%20circle.png?alt=media&token=15b74ea6-4019-4ba3-8205-80188eaee0b4&_gl=1*ipvxnu*_ga*MzkzNTk4NzYyLjE2ODI5NzI2MDI.*_ga_CW55HF8NVT*MTY4NTkwMDkwNy4zLjEuMTY4NTkwMDkxNC4wLjAuMA.."),
                ),
              ),
              Expanded(
                child: Container(
                    height: 80,
                    // margin: const EdgeInsets.all(15),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('${widget.nombre}',
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w600,
                                // fontStyle: FontStyle.italic,
                                fontFamily: 'Open Sans',
                                fontSize: 18)),
                        Text(
                          "NHM: " + obtenerNumeroAleatorio(),
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic,
                              // fontFamily: 'Open Sans',
                              fontSize: 14),
                        ),
                        Text(
                          "Fecha de nacimiento: " +
                              '${widget.fecha_nacimiento}',
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic,
                              // fontFamily: 'Open Sans',
                              fontSize: 14),
                        ),
                      ],
                    )),
              ),
              widget.fecha_consulta == ""
                  ? Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: obtenerColorPorPrioridad(widget.nivel_consulta),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Center(
                            child: Text(
                          widget.nivel_consulta,
                          style: TextStyle(color: Colors.white),
                        )),
                      ))
                  : Container()
            ],
          )),
    );
  }
}
