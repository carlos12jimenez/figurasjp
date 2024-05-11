import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Interfaz de la aplicación
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('1390-22-13878'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: CustomPaint(
          painter: MyCustomPainter(),
          child: Container(),
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final offsetX = size.width / 2;
    final offsetY = size.height / 2;

    // Dibuja un cuadrado
    final squarePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 8.0
      ..style = PaintingStyle.stroke;
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset(offsetX, offsetY - 200), width: 100, height: 100),
        squarePaint);

    // Dibuja una línea
    final linePaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 8.0
      ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset(offsetX - 200, offsetY - 100),
        Offset(offsetX + 200, offsetY - 100), linePaint);

    // Dibuja un círculo
    final circlePaint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 3.0
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(offsetX, offsetY), 45, circlePaint);

    // Dibuja un círculo
    final borderCirclePaint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 5.0
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(offsetX, offsetY + 120), 45, borderCirclePaint);

    // Dibuja un cuadrado con texto
    final textSquarePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset(offsetX, offsetY + 250), width: 100, height: 100),
        textSquarePaint);
    final textPainter = TextPainter(
      text: const TextSpan(
        text: 'Juan Carlos jimenez',
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(offsetX - 80, offsetY + 215));

// Dibuja una línea curva
    final curvePaint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 8.0
      ..style = PaintingStyle.stroke;

    final double controlPointDistance =
        200.0; // Distancia de los puntos de control desde los puntos finales

    final path = Path()
      ..moveTo(offsetX - 170, offsetY + 220) // Punto de inicio
      ..cubicTo(
          offsetX - 170,
          offsetY + 220 + controlPointDistance, // Primer punto de control
          offsetX + 170,
          offsetY + 220 + controlPointDistance, // Segundo punto de control
          offsetX + 170,
          offsetY + 220); // Punto final
    canvas.drawPath(path, curvePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
