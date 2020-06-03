import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:starship_game/game_controller.dart';

class Background {
  String spaceName;

  GameController gameController;
  Rect spaceRect;
  Sprite spaceSprite;

  Background(this.gameController, [String imName]) {
    spaceName = imName ?? 'background/back_for_spaceship_game.jpg';
    spaceSprite = Sprite(spaceName);
    spaceRect = Rect.fromLTWH(
        0,
        0,//gameController.screenSize.height - (gameController.titleSize * 20),
        gameController.titleSize * 10,
        gameController.titleSize * 6 );
  }

  void render(Canvas c) {
    spaceSprite.renderRect(c, spaceRect);
  }

  void update(double t) {}
}
