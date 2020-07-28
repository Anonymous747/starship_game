import 'package:starship_game/components/bullet.dart';
import 'package:starship_game/components/enemy.dart';
import 'package:starship_game/components/game_controller.dart';

class BulletSpowner {
  final GameController gameController;
  final int spawnInterval = 2000;
  int nextSpown;
  
  BulletSpowner(this.gameController) {
    initialize();
  }

  void initialize() {
    killAllBullets();
    nextSpown = DateTime.now().millisecondsSinceEpoch + spawnInterval;
  }

  void killAllBullets() {
    gameController.bullets.forEach((Bullet bullet) => bullet.isGot = true);
  }

  void update(double t) {
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now >= nextSpown ) {
      gameController.spawnBullet();
      nextSpown = now + spawnInterval;
    }
  } 
}