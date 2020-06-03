import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:starship_game/game_controller.dart';

class Spaceship {
  final GameController gameController;
  int maxHealth;
  int currentHealth;
  Rect spaceshipRect;
  Sprite spaceshipSprite;
  bool isDead = false;


  Spaceship(this.gameController) {
    maxHealth = currentHealth = 300;
    final size = gameController.titleSize * 1.5;
    spaceshipSprite = Sprite('player/roundysh.png');
    spaceshipRect = Rect.fromLTWH(
      gameController.screenSize.width / 10, 
      gameController.screenSize.height / 2, 
      size, 
      size
    );
  }


    void render(Canvas c) {
      spaceshipSprite.renderRect(c, spaceshipRect);
    }

    void update(double t) {
      if (!isDead && currentHealth >= 0) {
        isDead = true;
        gameController.initialize();
      }
    }
}