import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:starship_game/components/game_controller.dart';
import 'package:starship_game/components/my_text_painter.dart';

class SelectionMenu {
  final GameController gameController;
  MyTextPainter okPainter;
  MyTextPainter noPainter;
  MyTextPainter questionPainter;
  Rect menuRect;
  Rect selectionOkRect;
  Rect selectionNoRect;
  Offset questionPosition;
  Offset okPosition;
  Offset noPosition;

  Sprite menuSprite;
  Sprite okButton;
  Sprite noButton;

  SelectionMenu(this.gameController) {
    double indent = gameController.screenSize.width / 3 -
        gameController.screenSize.width / 4;
    double width = gameController.screenSize.width;
    double height = gameController.screenSize.height;
    menuRect = Rect.fromLTWH(
        width / 4,
        height / 4,
        width / 2,
        height / 2);
    selectionOkRect = Rect.fromLTWH(
        width * 5 / 8 - indent,
        height * 5 / 9,
        width / 8,
        height / 8);
    selectionNoRect = Rect.fromLTWH(
        width / 3,
        height * 5 / 9,
        width / 8,
        height / 8);
    
    questionPainter = MyTextPainter(gameController, Offset(menuRect.center.dx, menuRect.center.dy * 5 / 6), 'Would you lile to repite?');
    okPainter = MyTextPainter(gameController, selectionOkRect.center, 'ok');
    noPainter = MyTextPainter(gameController, selectionNoRect.center, 'no');

    menuSprite = Sprite('menu/finishMenu.png');
    okButton = Sprite('menu/button.png');
    noButton = Sprite('menu/button.png');
  }

  void render(Canvas c) {
    Paint menuColor = Paint()..color = Colors.white;
    Paint okColor = Paint()..color = Colors.blue;
    Paint noColor = Paint()..color = Colors.red;
    
    //c.drawRect(menuRect, menuColor);
    menuSprite.renderRect(c, menuRect);
    //c.drawRect(selectionOkRect, okColor);
    okButton.renderRect(c, selectionOkRect);
    //c.drawRect(selectionNoRect, noColor);
    noButton.renderRect(c, selectionNoRect);

    questionPainter.render(c);
    okPainter.render(c);
    noPainter.render(c);    

  }

  void update(double t) {
    questionPainter.update(t);
    okPainter.update(t);
    noPainter.update(t);
  }
}
