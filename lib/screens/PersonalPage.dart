// Importació dels paquets necessaris i d'una classe personalitzada.
import 'package:flutter/material.dart';
import 'package:practicafinal2/classes/Persona.dart';

// Definició del widget 'PersonalPage', que extén 'StatelessWidget'.
class PersonalPage extends StatelessWidget {
  // Creació d'una clau per controlar l'estat del formulari i controladors de text per als camps d'entrada.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Recuperació de l'objecte 'Persona' passat com a argument des de la pàgina anterior.
    final persona = ModalRoute.of(context)!.settings.arguments as Persona;

    // Mostrar els atributs de l'objecte 'Persona' (si hi ha un mètode per fer-ho).
    persona.displayAttributes();

    // Establir els valors inicials dels camps de text basats en l'objecte 'Persona'.
    _nameController.text = persona.name ?? '';
    _surnameController.text = persona.surname ?? '';
    _dateOfBirthController.text = persona.dateOfBirth ?? '';
    _emailController.text = persona.email ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Poyato Ventayol',
          style: TextStyle(
            fontFamily: 'Pacifico',
          ),
        ), // Títol de la pàgina amb l'estil Pacifico.
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.pink,
                  Colors.purple,
                ], // Degradat de colors de rosa a porpra.
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Nom',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Si us plau, introdueix el teu nom';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _surnameController,
                    decoration: InputDecoration(
                      labelText: 'Cognom',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Si us plau, introdueix el teu cognom';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _dateOfBirthController,
                    decoration: InputDecoration(
                      labelText: 'Data de Naixement en DD/MM/AA',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Si us plau, introdueix la teva data de naixement';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Correu Electrònic',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Si us plau, introdueix el teu correu electrònic';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Validació de l'entrada del formulari i actualització de l'objecte 'persona'.
                      if (_formKey.currentState!.validate()) {
                        persona.name = _nameController.text;
                        persona.surname = _surnameController.text;
                        persona.dateOfBirth = _dateOfBirthController.text;
                        persona.email = _emailController.text;

                        // Mostrar els atributs actualitzats (si hi ha un mètode per fer-ho).
                        persona.displayAttributes();

                        // Navegació a la pàgina anterior amb l'objecte 'persona' actualitzat.
                        Navigator.of(context).pop(persona);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink, // Fons rosa per al botó.
                    ),
                    child: Text(
                      'Enviar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
