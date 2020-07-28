import 'dart:math';
import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:starship_game/components/game_controller.dart';
import 'package:starship_game/components/selection_menu.dart';

class Spaceship {
  final GameController gameController;
  int maxHealth;
  int currentHealth;
  Rect spaceshipRect;
  Sprite spaceshipSprite;
  SelectionMenu selectionMenu;
  bool isDead = false;

  Spaceship(this.gameController) {
    maxHealth = currentHealth = 300;
    final size = gameController.titleSize * 1.5;
    spaceshipSprite = Sprite('player/roundysh.png');
    spaceshipRect = Rect.fromLTWH(gameController.titleSize - size / 2,
        gameController.screenSize.height / 2 - size / 2, size, size);
    selectionMenu = SelectionMenu(gameController);
  }

  void render(Canvas c) {
    spaceshipSprite.renderRect(c, spaceshipRect);
    if (isDead) {
      selectionMenu.render(c);
    }
  }

  void update(double t) {
    if (!isDead && currentHealth <= 0) {
      isDead = true;
      selectionMenu.update(t);
      //gameController.initialize();
    }
  }

  void shiftOnSwipeUp(DragUpdateDetails details) {
    if (details.localPosition.dy <= spaceshipRect.center.dy && !isDead) {
      double stepDistance = gameController.titleSize * 2 * 0.015;
      //double toEdgeY = gameController.spaceship.spaceshipRect.center.dy;
      if (spaceshipRect.center.dy >= gameController.titleSize) {
        Offset stepToTapped = Offset.fromDirection(3 * pi / 2, stepDistance);
        spaceshipRect = spaceshipRect.shift(stepToTapped);
      }
    } else if (details.localPosition.dy >= spaceshipRect.center.dy && !isDead) {
      double stepDistance = gameController.titleSize * 2 * 0.015;
      // double toEdgeY = gameController.spaceship.spaceshipRect.center.dy;
      if (spaceshipRect.center.dy <=
          gameController.screenSize.height - gameController.titleSize) {
        Offset stepToTapped = Offset.fromDirection(pi / 2, stepDistance);
        spaceshipRect = spaceshipRect.shift(stepToTapped);
      }
    }
    // double stepDistance = gameController.titleSize * 2 * 0.005;
    // double toEdgeY = gameController.spaceship.spaceshipRect.center.dy;
    // Offset res = Offset(spaceshipRect.center.dx,
    //     details.globalPosition.dy);
    // if (stepDistance <= toEdgeY - gameController.titleSize * 1.25) {
    //   Offset stepToTapped = Offset.fromDirection(res.direction, stepDistance);
    //   spaceshipRect = spaceshipRect.shift(stepToTapped);
    //   print(spaceshipRect.center.dy);
    // }
  }

  void shiftOnSwipeDown(DragDownDetails details) {
    double stepDistance = gameController.titleSize * 2 * 0.05;
    double toEdgeY = gameController.screenSize.height -
        gameController.spaceship.spaceshipRect.center.dy;
    if (stepDistance <= toEdgeY - gameController.titleSize * 1.25) {
      Offset stepToTapped = Offset.fromDirection(pi / 2, stepDistance);
      spaceshipRect = spaceshipRect.shift(stepToTapped);
      print(spaceshipRect.center.dy);
    }
  }
}
