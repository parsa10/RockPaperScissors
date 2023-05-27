import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Abstract class which represents The Game Items e.g Rock , Paper , Scissor
abstract class GameItem extends StatelessWidget {
  final Offset position;

  const GameItem({required this.position, Key? key}) : super(key: key);

  // Abstract method that returns a new instance of the subclass with a new position value
  GameItem copyWith({required Offset position});

  double get size;

  Widget buildDraggable(
    BuildContext context,
    GameItem gameItem,
    List<GameItem> gameItems,
    List<Offset> velocities,
    Offset initialPosition,
    List<Offset> positions,
  );

  @override
  Widget build(BuildContext context) {
    return buildDraggable(context, this, [], [], Offset.zero, []);
  }
}

// Subclass which represents the rock item
class Rock extends GameItem {
  const Rock({required Offset position, Key? key})
      : super(position: position, key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/rock.svg',
      width: size,
      height: size,
    );
  }

  @override
  Rock copyWith({required Offset position}) {
    return Rock(position: position);
  }

  @override
  double get size => 25;

  @override
  Widget buildDraggable(
    BuildContext context,
    GameItem gameItem,
    List<GameItem> gameItems,
    List<Offset> velocities,
    Offset initialPosition,
    List<Offset> positions,
  ) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Draggable<GameItem>(
        feedback: gameItem.build(context),
        childWhenDragging: Container(),
        onDragEnd: (details) {
          // Calculate the direction the user dragged the game item in
          Offset dragDirection = details.offset - initialPosition;

          // Set the velocity to the drag direction with the same speed as before
          velocities[gameItems.indexOf(this)] = dragDirection /
              dragDirection.distance *
              velocities[gameItems.indexOf(this)].distance *
              7;

          // Update the position of the game item to the release position
          positions[gameItems.indexOf(this)] = details.offset;
        },
        child: gameItem.build(context),
      ),
    );
  }
}

// Subclass which represents the paper item
class Paper extends GameItem {
  const Paper({required Offset position, Key? key})
      : super(position: position, key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/paper.svg',
      width: size,
      height: size,
    );
  }

  @override
  Paper copyWith({required Offset position}) {
    return Paper(position: position);
  }

  @override
  double get size => 25;

  @override
  Widget buildDraggable(
    BuildContext context,
    GameItem gameItem,
    List<GameItem> gameItems,
    List<Offset> velocities,
    Offset initialPosition,
    List<Offset> positions,
  ) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Draggable<GameItem>(
        feedback: gameItem.build(context),
        childWhenDragging: Container(),
        onDragEnd: (details) {
          // Calculate the direction the user dragged the game item in
          Offset dragDirection = details.offset - initialPosition;

          // Set the velocity to the drag direction with the same speed as before
          velocities[gameItems.indexOf(this)] = dragDirection /
              dragDirection.distance *
              velocities[gameItems.indexOf(this)].distance *
              7;

          // Update the position of the game item to the release position
          positions[gameItems.indexOf(this)] = details.offset;
        },
        child: gameItem.build(context),
      ),
    );
  }
}

// Subclass which represents the scissor item
class Scissor extends GameItem {
  const Scissor({required Offset position, Key? key})
      : super(position: position, key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/scissor.svg',
      width: size,
      height: size,
    );
  }

  @override
  Scissor copyWith({required Offset position}) {
    return Scissor(position: position);
  }

  @override
  double get size => 25;

  @override
  Widget buildDraggable(
    BuildContext context,
    GameItem gameItem,
    List<GameItem> gameItems,
    List<Offset> velocities,
    Offset initialPosition,
    List<Offset> positions,
  ) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Draggable<GameItem>(
        feedback: gameItem.build(context),
        childWhenDragging: Container(),
        onDragEnd: (details) {
          // Calculate the direction the user dragged the game item in
          Offset dragDirection = details.offset - initialPosition;

          // Set the velocity to the drag direction with the same speed as before
          velocities[gameItems.indexOf(this)] = dragDirection /
              dragDirection.distance *
              velocities[gameItems.indexOf(this)].distance *
              7;

          // Update the position of the game item to the release position
          positions[gameItems.indexOf(this)] = details.offset;
        },
        child: gameItem.build(context),
      ),
    );
  }
}
