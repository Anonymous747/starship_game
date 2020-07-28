import 'dart:math';
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starship_game/components/background.dart';
import 'package:starship_game/components/bullet.dart';
import 'package:starship_game/components/enemy.dart';
import 'package:starship_game/components/healthbar.dart';
import 'package:starship_game/components/nickname.dart';
import 'package:starship_game/components/spaceship.dart';
import 'package:starship_game/spawners/bullet_spowner.dart';
import 'package:starship_game/spawners/enemy_spawner.dart';

class GameController extends Game {
  final SharedPreferences storage;
  Size screenSize;              //the size of screen
  double titleSize;             //mesure, which help control size of other object
  Background background;        //background
  HealthBar healthBar;          //reflects parcent of health of spaceship
  Nickname nickname;            //the nickname of character
  Spaceship spaceship;          //the main object which we control
  List<Bullet> bullets;         //list which contain all bullets on the playground
  BulletSpowner bulletSpowner;  //spawn bullets
  List<Enemy> enemies;          //list which contain all enemies on the playgraund
  EnemySpawner enemySpawner;    //spawn enemies

  GameController(this.storage) {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    background = Background(this);
    spaceship = Spaceship(this);
    healthBar = HealthBar(this);
    nickname = Nickname(this);
    bullets = List<Bullet>();
    bulletSpowner = BulletSpowner(this);
    enemies = List<Enemy>();
    enemySpawner = EnemySpawner(this);
  }

  //render the main components
  @override
  void render(Canvas c) {
    background.render(c);
    bullets.forEach((Bullet bullet) => bullet.render(c));
    enemies.forEach((Enemy enemy) => enemy.render(c));
    spaceship.render(c);
    healthBar.render(c);
    nickname.render(c);
  }
  
  //update state all of components
  @override
  void update(double t) {
    bullets.forEach((Bullet bullet) => bullet.update(t));
    bullets.removeWhere((Bullet bullet) => bullet.isGot);
    bulletSpowner.update(t);
    healthBar.update(t);
    spaceship.update(t);
    enemies.forEach((Enemy enemy) => enemy.update(t));
    enemies.removeWhere((Enemy enemy) => enemy.isDead);
    enemySpawner.update(t);
    nickname.update(t);
  }

  //change the size of map 
  @override
  void resize(Size size) {
    screenSize = size;
    titleSize = screenSize.height / 10;
    super.resize(size);
  }

  //spawn the bullets on the playground
  void spawnBullet() {
    bullets.add(Bullet(this));
  }

  //spawn enemies on the playground
  void spawnEnemy() {
    Random rnd = Random();
    double res = screenSize.height - titleSize;
    enemies.add(Enemy(this, screenSize.width + 10, rnd.nextDouble() * res));
  }

}