import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flame/effects.dart';
import 'dart:math';

void main() {
  var game = MyGame();
  runApp(GameWidget(game: game));
}

class MyGame extends BaseGame {
  var mySquare = SquareComponent();
  bool pause = false;

  var ship = SpriteComponent();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    print('loading assets');
    mySquare
      ..anchor = Anchor.center
      ..position = Vector2(200, 200);
    mySquare.addEffect(RotateEffect(
        angle: pi,
        duration: 5.0,
        isInfinite: true,
        isRelative: true,
        curve: Curves.bounceInOut));
    add(mySquare);

    ship
      ..sprite = await loadSprite('ship.png')
      ..position = Vector2(500, 300)
      ..size = Vector2(100, 100)
      ..anchor = Anchor.center;
    ship.addEffect(RotateEffect(
      angle: pi * -2,
      duration: 4,
      isInfinite: true,
      isRelative: true,
    ));
    add(ship);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // mySquare.x += 40 * dt;
  }
}

class SquareComponent extends PositionComponent {
  SquareComponent() : super(size: Vector2.all(100.0));
  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(size.toRect(), BasicPalette.green.paint());
  }
}
