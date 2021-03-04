import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/foundation.dart';
import '../mygame.dart';

class Backyard {
  final MyGame game;
  Sprite bgSprite;
  Rect bgRect;

  Backyard(this.game) {
    debugPrint('Backyard.construct');
    // bgSprite = Sprite('bg/backyard.png');
    // sprite = Sprite.fromImage(Flame.images.loadedFiles["title.png"]);
    // bgSprite = Sprite(Flame.images.loadedFiles('bg/backyard.png'));
    // bgSprite = Sprite.fromImage(Flame.images.loadedFiles['bg/backyard.png'].loadedImage);
    bgSprite = Sprite.fromImage(game.bgImage);
    
    debugPrint('bgSprite.size=>${bgSprite.size}');
    
    bgRect = Rect.fromLTWH(
      0,
      game.screenSize.height - (game.tileSize * 23),
      game.tileSize * 9,
      game.tileSize * 23,
    );
    debugPrint(
        'Backyard game.screenSize=>${game.screenSize} game.tileSize=>${game.tileSize}');
    debugPrint('Backyard bgRect=>$bgRect');
  }

  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  void update(double t) {
    debugPrint('Backyard.update');
  }
}
