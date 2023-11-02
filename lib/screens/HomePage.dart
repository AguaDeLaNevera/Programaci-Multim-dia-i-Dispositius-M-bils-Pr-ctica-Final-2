import 'package:flutter/material.dart';
import 'package:practicafinal2/classes/Persona.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// Classe estat per HomePage
class _HomePageState extends State<HomePage> {
  // Instanciam la classe persona
  Persona persona = Persona(
    'John',
    'Doe',
    '20/01/2003',
    'johndoe@example.com',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // cream la appbar
      appBar: AppBar(
        title: Text('SPPMMD', style: TextStyle(fontFamily: 'Pacifico')),
      ),
      body: Stack(
        children: <Widget>[
          // gradient background.
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Displaying the person's name.
                Text(
                  'Welcome, ${persona.name} ${persona.surname}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Raleway',
                  ),
                ),
                SizedBox(height: 20),
                // Displaying the person's date of birth.
                Text(
                  'Date of Birth: ${persona.dateOfBirth}',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 10),
                // Displaying the person's email.
                Text(
                  'Email: ${persona.email}',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // floating action buttons.
      floatingActionButton: _createButtons(context, persona),
    );
  }

  // method to create the floating action buttons.
  Widget _createButtons(BuildContext context, Persona persona) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // botó 1.
        FloatingActionButton(
          child: Icon(Icons.edit),
          backgroundColor: Colors.green,
          onPressed: () {
            // anam a personal page
            Navigator.pushNamed(context, '/personal', arguments: persona)
                .then((value) {
              if (value != null && value is Persona) {
                // update a persona
                setState(() {
                  persona = value;
                });
              }
            });
          },
        ),
        SizedBox(width: 20),
        // botó 2
        FloatingActionButton(
          child: Icon(Icons.widgets),
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.pushNamed(context, '/widget');
          },
        ),
      ],
    );
  }
}
