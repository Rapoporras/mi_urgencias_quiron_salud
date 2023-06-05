import 'package:flutter/material.dart';
import 'package:mi_urgencias_quiron_salud/Pages/urgencia.dart';

class CajaUrgencia extends StatefulWidget {
  const CajaUrgencia(
      {super.key,
      required this.fecha,
      required this.alta,
      required this.motivo});

  final String fecha, motivo;
  final bool alta;
  @override
  State<CajaUrgencia> createState() => _CajaUrgenciaState();
}

class _CajaUrgenciaState extends State<CajaUrgencia> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                  height: 80,
                  // margin: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                      color: Color(0xFFffffff),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Fecha de visita: " + '${widget.fecha}',
                        style: TextStyle(
                            color: Color(0xFF4B4E53),
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic,
                            // fontFamily: 'Open Sans',
                            fontSize: 14),
                      ),
                      Text('${widget.motivo}',
                          style: TextStyle(
                              color: Color(0xFF4B4E53),
                              fontWeight: FontWeight.w900,
                              // fontStyle: FontStyle.italic,
                              fontFamily: 'Open Sans',
                              fontSize: 22))
                    ],
                  )),
            ),
            InkWell(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Urgencia()),
                )
              },
              child: widget.alta
                  ? Container(
                      height: 80,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Color(0xFF00A6A0),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15))),
                      child: const RotatedBox(
                        quarterTurns: 3,
                        child: //your text
                            Text(
                          "ALTA",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    )
                  : Container(
                      height: 80,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Color(0xFF4B4E53),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15))),
                      child: const RotatedBox(
                        quarterTurns: 3,
                        child: //your text
                            Text(
                          "VER MÁS",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
