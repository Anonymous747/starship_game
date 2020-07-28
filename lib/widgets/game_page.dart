import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starship_game/components/game_controller.dart';

class GameWidget extends StatefulWidget {
  GameWidget();

  @override
  _GameWidgetState createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  SharedPreferences storage;
  Size size;
  _GameWidgetState() {
    initialize();
  }

  void initialize() async {
    storage = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    GameController gameController = GameController(storage);
    return GestureDetector(
      // onVerticalDragDown: (details) {
      //   gameController.spaceship.shiftOnSwipeDown(details);
      // },
      onTapDown: (details) {
        if (gameController.spaceship.isDead) {
          double screenWidth = gameController.screenSize.width;
          double screenHeight = gameController.screenSize.height;
          double indent = screenWidth / 3 - screenWidth / 4;
          if (details.globalPosition.dx >= screenWidth * 5 / 8 - indent 
              && details.globalPosition.dx <= screenWidth * 5 / 8 - indent + screenWidth / 8
              && details.globalPosition.dy >= screenHeight * 5 / 9
              && details.globalPosition.dy <= screenHeight * 5 / 9 + screenHeight / 8) {
                gameController.initialize();
              }
          if (details.globalPosition.dx >= screenWidth / 3
              && details.globalPosition.dx <= screenWidth /3 + screenWidth / 8
              && details.globalPosition.dy >= screenHeight * 5 / 9
              && details.globalPosition.dy <= screenHeight * 5 / 9 + screenHeight / 8) {
                Navigator.of(context).pop();
              }
        }
      },
      onVerticalDragUpdate: (details) {
        gameController.spaceship.shiftOnSwipeUp(details);
      },
      
      child: gameController.widget,
    );
  }
}
