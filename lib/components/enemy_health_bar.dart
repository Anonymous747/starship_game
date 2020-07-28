import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:starship_game/components/enemy.dart';
import 'package:starship_game/components/game_controller.dart';

class EnemyHealthBar {
  GameController gameController;
  Enemy enemy;
  double leftX;
  double rightX;
  double topY;
  Rect enemyHealthBarRect;
  Rect remainingHealthBarRect;

  EnemyHealthBar(
      this.gameController, this.enemy, this.leftX, this.rightX, this.topY) {
    enemyHealthBarRect = Rect.fromLTWH(
        leftX, topY, rightX - leftX, gameController.titleSize * 0.1);
    remainingHealthBarRect = Rect.fromLTWH(
        leftX, topY, rightX - leftX, gameController.titleSize * 0.1);
  }

  void render(Canvas c) {
    if (!enemy.isDead) {
      Paint enemyHealthBarColor = Paint()..color = Color(0xFFFF0000);
      Paint remainingBarColor = Paint()..color = Colors.amber[300];

      c.drawRect(enemyHealthBarRect, enemyHealthBarColor);
      c.drawRect(remainingHealthBarRect, remainingBarColor);
    }
  }

  void update(double t) {
    if (!enemy.isDead) {
      double speed = enemy.speed * t;
      double percentHealth = enemy.currentHealth / enemy.maxHealth;
      remainingHealthBarRect =
          remainingHealthBarRect.shift(Offset.fromDirection(pi, speed));
      enemyHealthBarRect =
          enemyHealthBarRect.shift(Offset.fromDirection(pi, speed));
      if (enemy.currentHealth != enemy.maxHealth) {
        remainingHealthBarRect = Rect.fromLTWH(
            enemy.enemyRect.topLeft.dx,
            enemy.enemyRect.topLeft.dy - 10,
            (enemy.enemyRect.topRight.dx - enemy.enemyRect.topLeft.dx) * percentHealth,
            gameController.titleSize * 0.1);
      }
    }
  }
}
