import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starship_game/game_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Util flameUtil = Util();
  flameUtil.fullScreen();
  flameUtil.setOrientations(
      [
        DeviceOrientation.landscapeLeft, 
        DeviceOrientation.landscapeRight
      ]);
  Flame.images.loadAll(<String>[
    'background/back_for_spaceship_game.jpg',
    'player/spaceship.png',
    'player/roundysh.png',
  ]);

  SharedPreferences storage = await SharedPreferences.getInstance();
  GameController gameContoller = GameController(storage);
  runApp(gameContoller.widget);
}
