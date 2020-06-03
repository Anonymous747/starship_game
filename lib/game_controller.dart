import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starship_game/components/background.dart';
import 'package:starship_game/components/spaceship.dart';

class GameController extends Game {
  final SharedPreferences storage;
  Size screenSize;
  double titleSize;
  Background background;
  Spaceship spaceship;

  GameController(this.storage) {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    background = Background(this);
    spaceship = Spaceship(this);
  }

  @override
  void render(Canvas c) {
      background.render(c);
      spaceship.render(c);
    }
  
  @override
  void update(double t) {
    background.update(t);
    spaceship.update(t);
  }

  @override
  void resize(Size size) {
    screenSize = size;
    titleSize = screenSize.width / 10;
    super.resize(size);
  }
}