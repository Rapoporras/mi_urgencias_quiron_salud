import 'package:flutter/material.dart';
import 'package:mi_urgencias_quiron_salud/Pages/home.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Urgencias',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.red[800],
        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: const LoginPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bool checkedValue = false;

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          SizedBox(
            height: 100,
          ),
          Container(
              child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Introduzca el código para obtener información de seguimiento del paciente en urgencias",
                          textAlign: TextAlign.center,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Introduce codigo de Cita',
                          ),
                        ),
                        CheckboxListTile(
                          title: Text(
                              "He leído y acepto las Políticas de privacidad"),
                          value: checkedValue,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue = newValue!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity
                              .leading, //  <-- leading Checkbox
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()),
                              );
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    color: Color(0xFF00A6A0)),
                                child: Center(
                                  child: Text(
                                    "Entrar como invitado",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                  ))),
          SizedBox(
            height: 150,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            color: Color(0xFF00A6A0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Si dispones de una cuenta en Quirón Salud puedes iniciar sesión con tus datos",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Color(0xFFFFFFFF)),
                        child: Center(
                          child: Text(
                            "Entrar como invitado",
                            style: TextStyle(
                              color: Color(0xFF00A6A0),
                            ),
                          ),
                        )),
                  ),
                )
              ],
            ),
          )
          // ElevatedButton(
          //   child: const Text('Open route'),
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => const Home()),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
