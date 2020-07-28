import 'package:flutter/material.dart';
import 'package:starship_game/components/game_controller.dart';

class MyTextPainter {
  final GameController gameController;
  final String text;
  Offset position;
  TextPainter painter;

  MyTextPainter(this.gameController, this.position, this.text) {
    painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
  }

  void render(Canvas c) {
    painter.paint(c, position);
  }

  void update(double t) {
    painter.text = TextSpan(
        text: text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ));
    painter.layout();

    position = Offset(
        position.dx - (painter.width / 2),
        position.dy - (painter.height / 2), 
      );
  }
}