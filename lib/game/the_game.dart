import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/app.dart';
import 'game_items.dart';

class TheGame extends StatefulWidget {
  const TheGame({Key? key}) : super(key: key);

  @override
  State<TheGame> createState() => _TheGameState();
}

class _TheGameState extends State<TheGame> {
  List<Widget> widgets = [];
  List<GameItem> gameItems = [];
  List<Offset> positions = [];
  List<Offset> velocities = [];
  double _maxWidth = 0.0;
  double _maxHeight = 0.0;
  late Timer _updateTimer;

  @override
  void initState() {
    super.initState();
    // Execute code after the frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateSize();
      _createGameItems();
      _createWidgets();
    });

    // Set up a periodic timer to update positions and detect collisions
    _updateTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        _updatePositions();
        _detectCollisions();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.isDarkMode
          ? Colors.blueGrey
          : Theme.of(context).colorScheme.background,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          _maxWidth = constraints.maxWidth;
          _maxHeight = constraints.maxHeight;
          return Stack(
            children: widgets,
          );
        },
      ),
    );
  }

  // Update the size variables with the current screen size
  void _updateSize() {
    setState(() {
      _maxWidth = MediaQuery.of(context).size.width;
      _maxHeight = MediaQuery.of(context).size.height;
    });
  }

  // Create the game items (rocks, papers, and scissors)
  void _createGameItems() {
    for (int i = 0; i < 5; i++) {
      gameItems.add(const Rock(
        position: Offset(0, 0),
      ));
      gameItems.add(const Paper(
        position: Offset(0, 0),
      ));
      gameItems.add(const Scissor(
        position: Offset(0, 0),
      ));
    }

    for (int i = 0; i < 15; i++) {
      double left = Random().nextInt(_maxWidth.toInt() - 50).toDouble();
      double top = Random().nextInt(_maxHeight.toInt() - 50).toDouble();
      double dx = Random().nextBool() ? 1.0 : -1.0;
      double dy = Random().nextBool() ? 1.0 : -1.0;
      positions.add(Offset(left, top));
      velocities.add(Offset(dx, dy));
      gameItems[i] = gameItems[i % 15].copyWith(position: Offset(left, top));
    }
  }

  // Create the widget for each game item
  void _createWidgets() {
    for (int i = 0; i < gameItems.length; i++) {
      Widget widget = Positioned(
        left: positions[i].dx,
        top: positions[i].dy,
        child: gameItems[i],
      );
      widgets.add(widget);
    }
  }

  // Update the positions of the game items
  void _updatePositions() {
    for (int i = 0; i < gameItems.length; i++) {
      positions[i] += velocities[i] * 5;

      if (positions[i].dx < 0 ||
          positions[i].dx + gameItems[i].size > _maxWidth) {
        velocities[i] = Offset(-velocities[i].dx, velocities[i].dy);
      }
      if (positions[i].dy < 0 ||
          positions[i].dy + gameItems[i].size > _maxHeight) {
        velocities[i] = Offset(velocities[i].dx, -velocities[i].dy);
      }

      gameItems[i] = gameItems[i].copyWith(position: positions[i]);

      widgets[i] = Positioned(
        left: positions[i].dx,
        top: positions[i].dy,
        child: gameItems[i],
      );
    }
  }

  // Detect collisions between game items
  void _detectCollisions() {
    for (int i = 0; i < gameItems.length; i++) {
      for (int j = i + 1; j < gameItems.length; j++) {
        if (_boundingBox(gameItems[i]).overlaps(_boundingBox(gameItems[j]))) {
          if (gameItems[i].runtimeType == gameItems[j].runtimeType) {
            Offset temp = velocities[i];
            velocities[i] = velocities[j];
            velocities[j] = temp;
          } else {
            GameItem winner = gameItems[i];
            GameItem loser = gameItems[j];
            if ((gameItems[i] is Rock && gameItems[j] is Scissor) ||
                (gameItems[i] is Paper && gameItems[j] is Rock) ||
                (gameItems[i] is Scissor && gameItems[j] is Paper)) {
              winner = gameItems[i];
              loser = gameItems[j];
            } else {
              winner = gameItems[j];
              loser = gameItems[i];
            }
            gameItems.remove(loser);
            positions.removeAt(j);
            velocities.removeAt(j);
            widgets.removeAt(j);
            gameItems[i] = winner.copyWith(position: positions[i]);
            widgets[i] = Positioned(
              left: positions[i].dx,
              top: positions[i].dy,
              child: gameItems[i],
            );
            velocities[i] = Offset(-velocities[i].dx, -velocities[i].dy);
          }
        }
      }
    }
  }

  // Get the bounding box of a game item
  Rect _boundingBox(GameItem item) {
    return Rect.fromLTWH(
      item.position.dx,
      item.position.dy,
      item.size,
      item.size,
    );
  }

  // Release and cancel the timer to avoid memory leak
  @override
  void dispose() {
    _updateTimer.cancel();
    super.dispose();
  }
}
