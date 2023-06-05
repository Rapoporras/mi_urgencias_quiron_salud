import 'package:flutter/material.dart';
import 'package:mi_urgencias_quiron_salud/Pages/Login.dart';

class Configuracion extends StatefulWidget {
  const Configuracion({super.key});

  @override
  State<Configuracion> createState() => _ConfiguracionState();
}

class _ConfiguracionState extends State<Configuracion> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: ElevatedButton(
        child: const Text('Open route'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const LoginPage(title: 'Flutter Demo Home Page'),
            ),
          );
        },
      ),
    ));
  }
}
