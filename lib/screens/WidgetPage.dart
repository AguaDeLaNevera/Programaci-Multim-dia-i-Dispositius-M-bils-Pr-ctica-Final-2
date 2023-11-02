import 'package:flutter/material.dart';

class WidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Inici de l'aplicació i definició de l'estructura de la pàgina

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero/Paint'), // Títol de la barra superior
      ),
      body: Center(
        child: CustomPaint(
          painter:
              MyCustomPainter(), // Pintor personalitzat per a dibuixar a la pantalla
          child: Hero(
            tag: 'helloText', // Etiqueta per a l'animació Hero
            child: Text(
              'Aquí farem les proves dels widgets',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: _createButton(context), // Botons d'acció
    );
  }

  Widget _createButton(BuildContext context) {
    // Funció per a crear els botons flotants

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          child: Icon(Icons.arrow_back), // Icona de retrocés
          backgroundColor: Colors.green, // Color de fons del botó
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return WidgetPage();
                },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;
                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);
                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              ),
            );
          },
        ),
        SizedBox(width: 20),
        FloatingActionButton(
          child: Icon(Icons.arrow_upward), // Icona de pujada
          backgroundColor: Colors.blue, // Color de fons del botó
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return WidgetPage();
                },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, 1.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;
                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);
                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              ),
            );
          },
        ),
        FloatingActionButton(
          child: Icon(Icons.house), // Icona de casa
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
      ],
    );
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Funció per a dibuixar una línia vermella al mig de la pantalla
    final paint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // Verifica si cal tornar a dibuixar
    return false;
  }
}
