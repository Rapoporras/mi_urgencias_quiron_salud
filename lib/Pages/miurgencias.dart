import 'package:flutter/material.dart';
import 'package:mi_urgencias_quiron_salud/Component/caja_datos.dart';
import 'package:mi_urgencias_quiron_salud/Component/caja_urgencia.dart';

class MiUrgencias extends StatefulWidget {
  const MiUrgencias({super.key});

  @override
  State<MiUrgencias> createState() => _MiUrgenciasState();
}

class _MiUrgenciasState extends State<MiUrgencias> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CajaDatos(),
        const SizedBox(height: 10),
        CajaUrgencia(
            fecha: "14/05/2023", alta: false, motivo: "Dolor de cabeza"),
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
        CajaUrgencia(
            fecha: "11/05/2023", alta: true, motivo: "Dolor de cabeza"),
        CajaUrgencia(
            fecha: "05/05/2023", alta: true, motivo: "Dolor de cabeza"),
        CajaUrgencia(
            fecha: "14/04/2023", alta: true, motivo: "Dolor de cabeza"),
      ],
    );
  }
}
