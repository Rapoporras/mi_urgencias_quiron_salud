import 'package:flutter/material.dart';
import 'package:mi_urgencias_quiron_salud/Pages/Login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedPageIndex = 0;
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
                'https://logotipoz.com/wp-content/uploads/2023/03/quironsalud.png'),
          ),
        ),
      ),
      body: [
        Center(
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
        )),
        Center(
          child: Text(
            'Relearn 👨‍🏫',
          ),
        ),
        Center(
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
        )),
      ][selectedPageIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedPageIndex,
        backgroundColor: Color(0xFF00A6A0),
        indicatorColor: Color(0xFF00cabf),
        onDestinationSelected: (int index) {
          setState(() {
            selectedPageIndex = index;
          });
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'Mi urgencias',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.engineering),
            icon: Icon(Icons.engineering_outlined),
            label: 'Administración',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: 'Configuración',
          ),
        ],
      ),
    );
  }
}
