import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:starship_game/components/enemy.dart';
import 'package:starship_game/components/game_controller.dart';

class Bullet {
  GameController gameController;
  int damage;
  Sprite bulletSprite;
  Rect bulletRect;
  bool isGot = false;

  Bullet(this.gameController) {
    double size = gameController.titleSize / 2;
    damage = 50;
    bulletSprite = Sprite('bullet/snawball.png');
    bulletRect = Rect.fromLTWH(
      gameController.spaceship.spaceshipRect.center.dx - size / 2,
      gameController.spaceship.spaceshipRect.center.dy - size / 2,
      size,
      size,
    );
  }

  void render(Canvas c) {
    if (!isGot) {
      bulletSprite.renderRect(c, bulletRect);
    }
  }

  void update(double t) {
    if (!isGot) {
      if (!gameController.spaceship.isDead) {
        double stepDistance = gameController.titleSize * 2 * t;
        //double heigth = gameController.spaceship.spaceshipRect.center.dy;
        double toEdgeX = gameController.screenSize.width -
            gameController.spaceship.spaceshipRect.center.dx;
        if (stepDistance <= toEdgeX - gameController.titleSize * 1.25) {
          Offset stepToEdge = Offset.fromDirection(0, stepDistance);
          bulletRect = bulletRect.shift(stepToEdge);
        }
      }
      //the part which checks if the bullet hit
      if (gameController.enemies.any((Enemy enemy) {
        if (bulletRect.overlaps(enemy.enemyInternalRect)) {
          enemy.currentHealth -= damage;
          isGot = true;
          return true;
        }
        return false;
      })) {
        print('yes');
      }

      if (bulletRect.center.dx > gameController.screenSize.width + 10 &&
          !isGot) {
        isGot = true;
      }
    }
  }
}
