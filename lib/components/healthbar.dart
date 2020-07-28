import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:starship_game/components/game_controller.dart';

class HealthBar {
  GameController gameController;
  Rect healthBarRect;
  Rect remainingHealthRect;
  Rect healthBarSpriteRect;
  double _barWidth;
  Sprite healthBarSprite;

  HealthBar(this.gameController) {
    _barWidth = gameController.screenSize.width / 5;
    healthBarSprite = Sprite('healthBar/healthBar.png');
    healthBarSpriteRect =
        Rect.fromLTWH(0, 0, _barWidth, gameController.titleSize * 2.5);
    healthBarRect = Rect.fromLTWH(
        gameController.titleSize * 0.7,
        gameController.titleSize * 0.98,
        _barWidth * 0.72,
        gameController.titleSize * 0.35);

    remainingHealthRect =
        Rect.fromLTWH(gameController.titleSize * 0.7,
        gameController.titleSize * 0.98,
        _barWidth * 0.72,
        gameController.titleSize * 0.35);
  }

  void render(Canvas c) {
    Paint healthBarColor = Paint()..color = Color(0xFFFF0000);
    Paint remainigBarColor = Paint()..color = Color(0xFF00FF00);

    c.drawRect(healthBarRect, healthBarColor);
    c.drawRect(remainingHealthRect, remainigBarColor);
    healthBarSprite.renderRect(c, healthBarSpriteRect);
  }

  void update(double t) {
    double percentHealth = gameController.spaceship.currentHealth /
        gameController.spaceship.maxHealth;
    remainingHealthRect = Rect.fromLTWH(
        gameController.titleSize * 0.7,
        gameController.titleSize * 0.98,
        _barWidth * 0.72 * percentHealth,
        gameController.titleSize * 0.35);
  }
}
