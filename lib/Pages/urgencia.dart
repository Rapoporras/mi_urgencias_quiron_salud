import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mi_urgencias_quiron_salud/Component/caja_datos.dart';
import 'package:mi_urgencias_quiron_salud/Models/Consultas.dart';
import 'package:mi_urgencias_quiron_salud/Pages/configuracion.dart';
import 'package:mi_urgencias_quiron_salud/Pages/miurgencias.dart';
import 'package:another_stepper/another_stepper.dart';
import 'package:quickalert/quickalert.dart';

class Urgencia extends StatefulWidget {
  const Urgencia({super.key, required this.consulta});
  final Consulta consulta;
  @override
  State<Urgencia> createState() => _UrgenciaState();
}

class _UrgenciaState extends State<Urgencia> {
  late Consulta _consulta;
  @override
  void initState() {
    super.initState();
    _consulta = widget.consulta;
  }

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
          leading: BackButton(color: Colors.white),
          centerTitle: true,
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Color(0xFF4B4E53),
          // Here we take the value from the LoginPage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Image(
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
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              CajaDatos(
                fecha_consulta: _consulta.fechaConsulta,
                nombre: _consulta.nombre,
                fecha_nacimiento: _consulta.fechaNacimiento,
                nivel_consulta: _consulta.nivelConsulta,
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Notificaciones y tiempo de espera visita medica",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Open Sans',
                    ),
                  )),
              Padding(
                padding: EdgeInsets.all(10),
                child: _consulta.fechaConsulta == ""
                    ? Column(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xff00A6A0)),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15))),
                              child: Column(
                                children: [
                                  Text(
                                    "Siguiente paso",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Open Sans',
                                    ),
                                  ),
                                  Text(
                                    _consulta.siguentePaso!.descripcion,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Open Sans',
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Color(0xff00A6A0),
                                border: Border.all(
                                    width: 2, color: Color(0xff00A6A0)),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15))),
                            child: Text(
                              "Tiempo estimado: " +
                                  _consulta.siguentePaso!.estimado,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontFamily: 'Open Sans',
                              ),
                            ),
                          )
                        ],
                      )
                    : Text(
                        "Consulta en alta",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          fontFamily: 'Open Sans',
                        ),
                      ),
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Pruebas clinicas",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Open Sans',
                    ),
                  )),
              Steps(pruebas: _consulta.pruebasClinicas),
              SizedBox(
                height: 15,
              ),
              _consulta.recomendaciones != ""
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Recomendaciones al alta",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: 'Open Sans',
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            _consulta.recomendaciones,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              fontFamily: 'Open Sans',
                            ),
                          ),
                        )
                      ],
                    )
                  : Container(),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Adminitrativo y consentimientos",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Open Sans',
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          LineIcons.pdfFile,
                          color: Color(0xffCA4A60),
                        ),
                        title: Text(
                          'Consentimientos firmados',
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          LineIcons.pdfFile,
                          color: Color(0xffCA4A60),
                        ),
                        title: Text('Receta Electrónica',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                            )),
                      ),
                      ListTile(
                        leading: Icon(
                          LineIcons.pdfFile,
                          color: Color(0xffCA4A60),
                        ),
                        title: Text('Ley de protección de datos',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                            )),
                      ),
                    ],
                  )),
              SizedBox(
                height: 150,
              ),
            ],
          ),
        ));
  }
}

class Step {
  Step(this.step, this.title, this.body, this.completed, this.tiempo,
      [this.isExpanded = false]);
  String step;
  String title;
  List<Paso> body;
  bool isExpanded, completed;
  String tiempo;
}

Future<List<Step>> getSteps(List<PruebasClinica> pruebas) async {
  List<Step> pasos = pruebas.map((dato) {
    return Step(dato.orden, dato.titulo, dato.pasos, dato.complete,
        dato.tiempoEsperaAprox);
  }).toList();
  return Future<List<Step>>.delayed(const Duration(seconds: 2), () => pasos);
}

class Steps extends StatelessWidget {
  const Steps({Key? key, required this.pruebas}) : super(key: key);
  final List<PruebasClinica> pruebas;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: FutureBuilder<List<Step>>(
            future: getSteps(pruebas),
            builder:
                (BuildContext context, AsyncSnapshot<List<Step>> snapshot) {
              if (snapshot.hasData) {
                return StepList(steps: snapshot.data ?? []);
              } else {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            }),
      ),
    );
  }
}

class StepList extends StatefulWidget {
  final List<Step> steps;
  const StepList({Key? key, required this.steps}) : super(key: key);
  @override
  State<StepList> createState() => _StepListState(steps: steps);
}

class _StepListState extends State<StepList> {
  final List<Step> _steps;
  _StepListState({required List<Step> steps}) : _steps = steps;

  List<StepperData> obtenerListaPasos(List<Paso> pasos) {
    return pasos.map<StepperData>((Paso step) {
      return StepperData(
          title: StepperText(step.descripcion,
              textStyle:
                  const TextStyle(fontFamily: 'Open Sans', color: Colors.grey)),
          iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: step.complete == true
                    ? Color(0xff00A6A0)
                    : Color(0xffCA4A60),
                borderRadius: BorderRadius.all(Radius.circular(30))),
          ));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _steps[index].isExpanded = !isExpanded;
        });
      },
      children: _steps.map<ExpansionPanel>((Step step) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: step.completed == true
                    ? Color(0xff00A6A0)
                    : Color(0xffCA4A60),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    step.title,
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                    ),
                  ),
                  Text(
                    step.tiempo,
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w300,
                        fontSize: 14),
                  )
                ],
              ),
            );
          },
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: AnotherStepper(
                  stepperList: obtenerListaPasos(step.body),
                  stepperDirection: Axis.horizontal,
                  iconWidth: 40,
                  iconHeight: 40,
                  activeBarColor: Color(0xff00A6A0),
                  inActiveBarColor: Colors.grey,
                  inverted: true,
                  verticalGap: 30,
                  barThickness: 8,
                ),
              ),
            ],
          ),
          isExpanded: step.isExpanded,
        );
      }).toList(),
    );
  }
}
