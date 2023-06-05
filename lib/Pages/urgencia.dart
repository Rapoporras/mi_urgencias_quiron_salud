import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mi_urgencias_quiron_salud/Component/caja_datos.dart';
import 'package:mi_urgencias_quiron_salud/Pages/configuracion.dart';
import 'package:mi_urgencias_quiron_salud/Pages/miurgencias.dart';

class Urgencia extends StatefulWidget {
  const Urgencia({super.key});

  @override
  State<Urgencia> createState() => _UrgenciaState();
}

class _UrgenciaState extends State<Urgencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Color(0xFF4B4E53),
        // Here we take the value from the LoginPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(
          child: const Image(
            width: 200,
            image: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/mi-urgencias-quiron-salud.appspot.com/o/image%201.png?alt=media&token=62871bcd-ff4b-4957-9b61-82bff3e67fa6&_gl=1*xgy7pz*_ga*MzkzNTk4NzYyLjE2ODI5NzI2MDI.*_ga_CW55HF8NVT*MTY4NTg5MDYyNi4yLjEuMTY4NTg5MTE4NS4wLjAuMA..'),
          ),
        ),
      ),
      body: ListView(
        children: [
          CajaDatos(),
          Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Evaluación Previa",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus",
              textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Pasos Recetados",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
          Steps(),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xFF4B4E53)),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    width: 120,
                    child: Center(
                      child: Text("Recomendaciones"),
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xFF4B4E53)),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    width: 120,
                    child: Center(
                      child: Text("Receta electronica"),
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xFF4B4E53)),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    width: 120,
                    child: Center(
                      child: Text("Informes medicos"),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 150,
          ),
        ],
      ),
      floatingActionButton: Container(
          width: 120,
          decoration: BoxDecoration(
              color: Color(0xFFCA4A60),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 30,
                  child: Text("Ext. alta",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.white)),
                ),
                Container(
                    width: 80,
                    decoration: BoxDecoration(
                        color: Color(0xFFF4788D),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text("60 min",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white)),
                    ))
              ],
            ),
          )),
    );
  }
}

class Step {
  Step(this.step, this.title, this.body, this.completed,
      [this.isExpanded = false]);
  String step;
  String title;
  String body;
  bool isExpanded, completed;
}

Future<List<Step>> getSteps() async {
  var _items = [
    Step(
        "0",
        'Install Flutter',
        'Install Flutter development tools according to the official documentation.',
        true),
    Step(
        "1",
        'Step 1: Create a project',
        'Open your terminal, run `flutter create <project_name>` to create a new project.',
        false),
    Step(
        "1",
        'Step 2: Run the app',
        'Change your terminal directory to the project directory, enter `flutter run`.',
        false),
    Step(
        "2",
        'Step 2: Run the app',
        'Change your terminal directory to the project directory, enter `flutter run`.',
        false),
  ];
  return Future<List<Step>>.delayed(const Duration(seconds: 2), () => _items);
}

class Steps extends StatelessWidget {
  const Steps({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: FutureBuilder<List<Step>>(
            future: getSteps(),
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
                child: Text(
                  step.step,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              title: Text(step.title),
            );
          },
          body: ListTile(
            title: Text(step.body),
          ),
          isExpanded: step.isExpanded,
        );
      }).toList(),
    );
  }
}
