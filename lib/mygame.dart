import 'dart:math';
import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter/gestures.dart';

import 'components/backyard.dart';
import 'components/fly.dart';

class MyGame extends Game {
  MyGame() {
    initialize();
  }

  void initialize() async {
    debugPrint('MyGame.initialize');
    // flies = List<Fly>();
    flies = [];
    rnd = Random();
    resize(await Flame.util.initialDimensions());
    
    final bgImage = await Flame.images.load('bg/backyard.png');

    background = Backyard(this);
    spawnFly();
  }

  Size screenSize;
  double tileSize;
  var bgImage;
  Backyard background;
  List<Fly> flies;
  Random rnd;

  void render(Canvas canvas) {
    background.render(canvas);
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);
    flies.forEach((Fly fly) => fly.render(canvas));
  }

  void update(double t) {
    flies.forEach((Fly fly) => fly.update(t));
    flies.removeWhere((Fly fly) => fly.isOffScreen);
  }

  void resize(Size size) {
    debugPrint('MyGame.resize');
    screenSize = size;
    tileSize = screenSize.width / 9;
    debugPrint('screenSize=>$screenSize / tileSize=>$tileSize');
  }

  void spawnFly() {
    debugPrint('MyGame.spawnFly');
    double x = rnd.nextDouble() * (screenSize.width - tileSize);
    double y = rnd.nextDouble() * (screenSize.height - tileSize);
    flies.add(Fly(this, x, y));
  }

  void onTapDown(TapDownDetails d) {
    debugPrint('MyGame.onTapDown');
    List<Fly>.from(flies).forEach((Fly fly) {
      if (fly.flyRect.contains(d.globalPosition)) {
        fly.onTapDown();
      }
    });
  }
}
