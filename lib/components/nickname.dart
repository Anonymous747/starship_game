import 'package:flutter/material.dart';
import 'package:starship_game/components/game_controller.dart';

class Nickname {
  final GameController gameController;
  TextPainter painter;
  Offset position;

  Nickname(this.gameController) {
    painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    position = Offset.zero;
  }

  void render(Canvas c) {
    painter.paint(c, position);
  }

  void update(double t) {
    painter.text = TextSpan(
        text: 'Anonymous',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ));
    painter.layout();

    position = Offset(
        (gameController.titleSize * 2) - (painter.width / 2),
        (gameController.titleSize * 0.5) - (painter.height / 2), 
      );
  }
}
