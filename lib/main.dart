import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:starship_game/widgets/menu_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Util flameUtil = Util();
  flameUtil.fullScreen();
  flameUtil.setOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  Flame.images.loadAll(<String>[
    'background/back_for_spaceship_game.jpg',
    'player/spaceship.png',
    'player/roundysh.png',
    'bullet/snawball.png',
    'enemy/enemySpaceship2.png',
    'enemy/enemySpaaceship2.png',
    'healthBar/healthBar.png',
    'menu/finishMenu.png',
    'menu/button.png'
  ]);
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  //SharedPreferences storage = await SharedPreferences.getInstance();
  //GameController gameContoller = GameController(storage);
  //runApp(gameContoller.widget);
  runApp(MaterialApp(home: MenuScreen()));
}
