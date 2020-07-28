import 'dart:math';
import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:starship_game/components/enemy_health_bar.dart';
import 'package:starship_game/components/game_controller.dart';

class Enemy {
  final GameController gameController;
  final double x;
  final double y;
  int currentHealth;
  int maxHealth;
  int damage;
  double speed;
  Rect enemyRect;
  Rect enemyInternalRect;
  bool isDead = false;
  Sprite enemySprite;
  EnemyHealthBar enemyHealthBar;

  Enemy(this.gameController, this.x, this.y) {
    currentHealth = maxHealth = 100;
    damage = 20;
    double size = gameController.titleSize * 1.2;
    speed = gameController.titleSize * 2;
    enemySprite = Sprite('enemy/enemySpaaceship2.png');
    enemyRect = Rect.fromLTWH(x, y, size, size);
    enemyInternalRect =
        Rect.fromLTWH(x + size / 4, y + size / 4, size / 2, size / 2);
    enemyHealthBar = EnemyHealthBar(gameController, this, enemyRect.topLeft.dx,
        enemyRect.topRight.dx, enemyRect.topLeft.dy - 10);
  }

  void render(Canvas c) {
    if (!isDead && !gameController.spaceship.isDead)
    enemyHealthBar.render(c);
    enemySprite.renderRect(c, enemyRect);
  }

  void update(double t) {
    if (!isDead && !gameController.spaceship.isDead) {
      double stepDistance = speed * t;
      double toPlayerX = enemyRect.center.dx -
          gameController.spaceship.spaceshipRect.center.dx;
      if (toPlayerX >= gameController.titleSize) {
        Offset stepToPlayer = Offset.fromDirection(pi, stepDistance);
        enemyRect = enemyRect.shift(stepToPlayer);
        enemyInternalRect = enemyInternalRect.shift(stepToPlayer);
        enemyHealthBar.update(t);
      } else {
        attack();
      }
      if (currentHealth <= 0) {
        isDead = true;
      }
    }
  }

  void attack() {
    if (!gameController.spaceship.isDead) {
      gameController.spaceship.currentHealth -= damage;
    }
  }
}
