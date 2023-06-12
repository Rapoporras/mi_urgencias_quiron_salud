import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mi_urgencias_quiron_salud/Component/caja_datos.dart';
import 'package:mi_urgencias_quiron_salud/Component/caja_urgencia.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

import '../Models/Consultas.dart';

class MiUrgencias extends StatefulWidget {
  const MiUrgencias({super.key});

  @override
  State<MiUrgencias> createState() => _MiUrgenciasState();
}

class _MiUrgenciasState extends State<MiUrgencias> {
  List _consultas = [];
  int index = 0;
  // Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/consultas.json');
    final data = await json.decode(response);
    final consulta = consultaFromJson(response);
    setState(() {
      //_items = data["items"];
      _consultas = consulta;
      index = obtenerNumeroAleatorio(_consultas);
    });
  }

  int obtenerNumeroAleatorio(List<dynamic> array) {
    Random random = Random();
    int numeroElementos = array.length;
    int numeroAleatorio = random.nextInt(numeroElementos);
    return numeroAleatorio;
  }

  String obtenerFechaActual() {
    DateTime fechaActual = DateTime.now();
    DateFormat formatoFecha = DateFormat('dd/MM/yyyy');
    String fechaFormateada = formatoFecha.format(fechaActual);
    return fechaFormateada;
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return !_consultas.isEmpty
        ? ListView(
            children: [
              CajaDatos(
                fecha_consulta: _consultas[index].fechaConsulta,
                nombre: _consultas[index].nombre,
                fecha_nacimiento: _consultas[index].fechaNacimiento,
                nivel_consulta: _consultas[index].nivelConsulta,
              ),
              const SizedBox(height: 10),
              _consultas[index].fechaConsulta == ""
                  ? CajaUrgencia(
                      fecha: obtenerFechaActual(),
                      alta: false,
                      motivo: _consultas[index].motivo,
                      consulta: _consultas[index],
                    )
                  : Center(
                      child: Text(
                        "No hay ninguna urgencia activa",
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                        ),
                      ),
                    ),
              Container(
                height: 30,
                margin: const EdgeInsets.all(15),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Historial de visitas",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'Open Sans',
                      fontSize: 20),
                ),
              ),
              _consultas[index].fechaConsulta != ""
                  ? CajaUrgencia(
                      fecha: _consultas[index].fechaConsulta,
                      alta: true,
                      motivo: _consultas[index].motivo,
                      consulta: _consultas[index],
                    )
                  : Center(
                      child: Text(
                        "No hay consultas anteriores",
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                        ),
                      ),
                    ),
            ],
          )
        : Container();
  }
}
