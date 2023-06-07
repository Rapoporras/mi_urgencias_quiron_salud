import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CajaDatos extends StatefulWidget {
  const CajaDatos({super.key});

  @override
  State<CajaDatos> createState() => _CajaDatosState();
}

class _CajaDatosState extends State<CajaDatos> {
  final now = DateTime.now();

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
                        const Text('Ignacio Porras Ibáñez',
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w600,
                                // fontStyle: FontStyle.italic,
                                fontFamily: 'Open Sans',
                                fontSize: 22)),
                        Text(
                          "Fecha de nacimiento: " +
                              DateFormat('yyyy/MM/dd').format(now),
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
              Container(
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Color(0xFF00A6A0),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                        child: Text(
                      "1",
                      style: TextStyle(color: Colors.white),
                    )),
                  ))
            ],
          )),
    );
  }
}
