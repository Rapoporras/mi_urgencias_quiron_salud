import 'package:flutter/material.dart';

class Administracion extends StatefulWidget {
  const Administracion({super.key});

  @override
  State<Administracion> createState() => _AdministracionState();
}

class _AdministracionState extends State<Administracion> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Container(
          height: 100,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Color(0xFF4B4E53),
              borderRadius: BorderRadius.all(Radius.circular(15))),
        ),
        SizedBox(height: 20),
        Container(
          height: 100,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Color(0xFFffffff),
              border: Border.all(
                width: 1,
                color: Color(0xFF4B4E53),
              ),
              borderRadius: BorderRadius.all(Radius.circular(15))),
        ),
        Container(
          height: 50,
          margin: EdgeInsets.all(15),
          alignment: Alignment.centerLeft,
          child: Text(
            "Historial de visitas",
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
                fontFamily: 'Open Sans',
                fontSize: 20),
          ),
        ),
      ],
    ));
  }
}
